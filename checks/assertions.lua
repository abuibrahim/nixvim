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

-- completion exists at all, with its compiled matcher.
check("blink.cmp loads", (pcall(require, "blink.cmp")))
check("blink fuzzy matcher loads", (pcall(require, "blink.cmp.fuzzy")))
check("blink.pairs loads", (pcall(require, "blink.pairs")))

-- plugins deliberately removed should stay gone.
check("real nvim-web-devicons absent", #vim.api.nvim_get_runtime_file("lua/nvim-web-devicons.lua", false) == 0)
check("barbecue absent", not pcall(require, "barbecue"))

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
