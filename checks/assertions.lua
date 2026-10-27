-- Asserts EFFECTIVE runtime state, not that the config merely evaluated.
-- Freeform nixvim `settings` accept unknown keys silently, so a build that
-- succeeds proves nothing about whether a setting took effect.

local failures = {}
local passed = 0

local function check(label, ok, got)
  if ok then
    passed = passed + 1
  else
    failures[#failures + 1] = ("%s (got: %s)"):format(label, vim.inspect(got))
  end
end

local function hl_bg(name)
  local h = vim.api.nvim_get_hl(0, { name = name, link = false })
  return h.bg
end

local function mapped(mode, lhs)
  for _, m in ipairs(vim.api.nvim_get_keymap(mode)) do
    if m.lhs == lhs then
      return true
    end
  end
  return false
end

-- nixvim prunes an empty list, after which lualine re-merges its own defaults.
local sections = require("lualine.config").get_config().sections
check("lualine_x is empty", #(sections.lualine_x or {}) == 0, sections.lualine_x)
check("lualine_c is diagnostics only", vim.deep_equal(sections.lualine_c, { "diagnostics" }), sections.lualine_c)

-- transparent_background does not cover floats; float.transparent does.
check("NormalFloat is transparent", hl_bg("NormalFloat") == nil, hl_bg("NormalFloat"))
check("TelescopeNormal is transparent", hl_bg("TelescopeNormal") == nil, hl_bg("TelescopeNormal"))
check("TelescopeSelection keeps a bg", hl_bg("TelescopeSelection") ~= nil, hl_bg("TelescopeSelection"))

-- catppuccin 2.0.0 moved integrations.native_lsp to top-level lsp_styles.
local ctp = require("catppuccin").options
check("catppuccin lsp_styles path exists", type(ctp.lsp_styles) == "table", ctp.lsp_styles)
check("catppuccin float.transparent", ctp.float.transparent == true, ctp.float)

-- 0.12 defaults these off; we turn them on.
local diag = vim.diagnostic.config()
check("diagnostics virtual_lines.current_line", type(diag.virtual_lines) == "table" and diag.virtual_lines.current_line == true, diag.virtual_lines)
check("diagnostics virtual_text off", diag.virtual_text == false, diag.virtual_text)
check("diagnostics severity_sort", diag.severity_sort == true, diag.severity_sort)

-- nixd and lua_ls provide no formatting, so these must come from conform.
local cf = require("conform").formatters_by_ft
check("conform formats nix", vim.tbl_contains(cf.nix or {}, "nixfmt"), cf.nix)
check("conform formats lua", vim.tbl_contains(cf.lua or {}, "stylua"), cf.lua)

-- folding is a top-level treesitter option; under `settings` it is silently
-- ignored. Assert the effective window option, not merely that the group has
-- autocmds -- highlight/indent alone would satisfy that.
vim.cmd("enew")
vim.bo.filetype = "lua"
vim.cmd("doautocmd FileType")
check("treesitter highlight active", vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] ~= nil)
check("treesitter folding sets foldexpr", vim.wo.foldexpr == "v:lua.vim.treesitter.foldexpr()", vim.wo.foldexpr)
check("treesitter folding sets foldmethod", vim.wo.foldmethod == "expr", vim.wo.foldmethod)
check("treesitter sets indentexpr", vim.bo.indentexpr ~= "", vim.bo.indentexpr)

-- textobjects: nixvim's `settings` forwards to a legacy API upstream dropped.
check("textobjects lookahead on", require("nvim-treesitter-textobjects.config").select.lookahead == true)
check("af bound in operator-pending", mapped("o", "af"), nil)
check("]f bound in normal", mapped("n", "]f"), nil)

-- plugins that were enabled but unreachable before.
check("trouble <leader>xx bound", mapped("n", " xx"), nil)
check("inlay hints <leader>uh bound", mapped("n", " uh"), nil)
check("hunk nav ]h bound", mapped("n", "]h"), nil)
check("session restore <leader>qs bound", mapped("n", " qs"), nil)
check("persistence save hook active", require("persistence").active() == true)

-- surround must not clobber the built-in `s`.
check("surround on gs prefix", mapped("n", "gsa"), nil)
check("normal-mode s left alone", not mapped("n", "s"), nil)

-- a '' string keeps its trailing newline, which lands in the rhs as <NL>.
local un = vim.fn.maparg(" un", "n")
check("<leader>un rhs has no trailing <NL>", un ~= "" and not un:find("<NL>", 1, true), un)

-- which-key prepends icons.group itself; a leading "+" renders as "++".
local wk_groups = {}
for _, s in ipairs(require("which-key.config").options.spec or {}) do
  if s.group and s.group:sub(1, 1) == "+" then
    wk_groups[#wk_groups + 1] = s.group
  end
end
check("which-key groups carry no leading +", #wk_groups == 0, wk_groups)

-- providers are dropped from the closure, not just disabled at runtime.
check("no ruby host bundled", vim.g.ruby_host_prog == nil, vim.g.ruby_host_prog)
check("no python3 host bundled", vim.g.python3_host_prog == nil, vim.g.python3_host_prog)
check("ruby provider off", vim.g.loaded_ruby_provider == 0, vim.g.loaded_ruby_provider)
check("python3 provider off", vim.g.loaded_python3_provider == 0, vim.g.loaded_python3_provider)

-- bufferline derives its own colours unless handed catppuccin's theme.
local sep = vim.api.nvim_get_hl(0, { name = "BufferLineSeparator", link = false })
local surface1 = tonumber(require("catppuccin.palettes").get_palette().surface1:sub(2), 16)
check("bufferline uses catppuccin theme", sep.fg == surface1, sep.fg)

-- completion exists at all, with its compiled matcher.
check("blink.cmp loads", (pcall(require, "blink.cmp")))
check("blink fuzzy matcher loads", (pcall(require, "blink.cmp.fuzzy")))
check("blink.pairs loads", (pcall(require, "blink.pairs")))

-- "_" must not shadow the servers' formatting: its formatter would stop
-- lsp_format = "fallback" from ever reaching ruff.
local py = vim.fn.tempname() .. ".py"
vim.fn.writefile({ "x=[1,2]" }, py)
vim.cmd.edit(py)
vim.wait(10000, function()
  local ruff = vim.lsp.get_clients({ bufnr = 0, name = "ruff" })[1]
  return ruff and ruff.initialized and ruff:supports_method("textDocument/formatting")
end)
require("conform").format({ lsp_format = "fallback" })
local line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
check("python is formatted by ruff", line == "x = [1, 2]", line)

-- <leader>ul hides every number, hybrid included, and restores both.
vim.notify = function() end
vim.wo.number, vim.wo.relativenumber = true, true
vim.api.nvim_feedkeys(vim.keycode(" ul"), "x", false)
check("<leader>ul hides all numbers", not vim.wo.number and not vim.wo.relativenumber, { vim.wo.number, vim.wo.relativenumber })
vim.api.nvim_feedkeys(vim.keycode(" ul"), "x", false)
check("<leader>ul restores hybrid numbers", vim.wo.number and vim.wo.relativenumber, { vim.wo.number, vim.wo.relativenumber })

-- the progress bar clears only once all in-flight progress has ended.
local sent = {}
local ui_send = vim.api.nvim_ui_send
vim.api.nvim_ui_send = function(s)
  sent[#sent + 1] = s
end
local ruff_id = vim.lsp.get_clients({ name = "ruff" })[1].id
local function progress(token, kind)
  vim.api.nvim_exec_autocmds("LspProgress", {
    data = { client_id = ruff_id, params = { token = token, value = { kind = kind } } },
  })
end
local clear = "\27]9;4;0;\27\\"
progress("a", "begin")
progress("b", "begin")
progress("a", "end")
check("progress bar kept while work remains", not vim.tbl_contains(sent, clear), sent)
progress("b", "end")
check("progress bar cleared when all finish", sent[#sent] == clear, sent)
vim.api.nvim_ui_send = ui_send

-- plugins deliberately removed should stay gone.
check("real nvim-web-devicons absent", #vim.api.nvim_get_runtime_file("lua/nvim-web-devicons.lua", false) == 0)
check("barbecue absent", not pcall(require, "barbecue"))
check("neo-tree absent", not pcall(require, "neo-tree"))

if #failures > 0 then
  io.stderr:write(("\nnvim assertions: %d passed, %d FAILED\n"):format(passed, #failures))
  for _, f in ipairs(failures) do
    io.stderr:write("  FAIL  " .. f .. "\n")
  end
  vim.cmd("cquit 1")
else
  io.stdout:write(("nvim assertions: all %d passed\n"):format(passed))
  vim.cmd("qall!")
end
