let
  inherit (import ./map.nix) keymap nmap lua;
in
{
  keymaps = [

    # Windows
    (nmap "<leader>ww" "<C-W>p" "Other Window")
    (nmap "<leader>wd" "<C-W>c" "Delete Window")
    (nmap "<leader>w-" "<C-W>s" "Split Window Below")
    (nmap "<leader>w|" "<C-W>v" "Split Window Right")

    # Save
    (nmap "<C-s>" "<cmd>w<CR>" "Save File")

    # Quit/Session
    (nmap "<leader>qq" "<cmd>quitall<CR>" "Quit All")

    # Toggle
    (nmap "<leader>ul" (lua ''
      function()
        local enabled = not (vim.wo.number or vim.wo.relativenumber)
        vim.wo.number = enabled
        vim.wo.relativenumber = enabled
        vim.notify("Line numbers " .. (enabled and "enabled" or "disabled"), vim.log.levels.INFO, { title = "nixvim" })
      end
    '') "Toggle Line Numbers")
    (nmap "<leader>uL" (lua ''
      function()
        vim.wo.relativenumber = not vim.wo.relativenumber
        vim.notify("Relative line numbers " .. (vim.wo.relativenumber and "enabled" or "disabled"), vim.log.levels.INFO, { title = "nixvim" })
      end
    '') "Toggle Relative Line Numbers")
    (nmap "<leader>uw" (lua ''
      function()
        vim.wo.wrap = not vim.wo.wrap
        vim.notify("Wrap " .. (vim.wo.wrap and "enabled" or "disabled"), vim.log.levels.INFO, { title = "nixvim" })
      end
    '') "Toggle Line Wrap")
    (nmap "<leader>uh" (lua ''
      function()
        local enabled = not vim.lsp.inlay_hint.is_enabled()
        vim.lsp.inlay_hint.enable(enabled)
        vim.notify("Inlay hints " .. (enabled and "enabled" or "disabled"), vim.log.levels.INFO, { title = "nixvim" })
      end
    '') "Toggle Inlay Hints")

    (keymap "v" "<" "<gv" "Indent Left")

    (keymap "v" ">" ">gv" "Indent Right")

    # Copy to system clipboard
    (keymap [ "n" "v" ] "<leader>y" "\"+y" "Copy to System Clipboard")

    # Set highlight on search, but clear on <ESC> in normal mode
    (nmap "<ESC>" "<cmd>nohlsearch<CR>" "Clear Search Highlight")

    # Indent blank lines
    (nmap "<leader>ui" "<cmd>IBLToggle<CR>" "Toggle Indent Guides")
    (nmap "<leader>uI" "<cmd>IBLToggleScope<CR>" "Toggle Indent Scope")
  ];
}
