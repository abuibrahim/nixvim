let
  inherit (import ./map.nix) nmap lua;
  pick =
    key: source:
    nmap key (
      lua "function() (vim.g.neorex and require('neorex.pick') or Snacks.picker).${source}() end"
    );
in
{
  # in neorex the pickers and vim.ui open in Rex's command palette; the snacks
  # picker is for Neovim's own TUI
  plugins.snacks.settings.picker.enabled = true;
  globals.neorex_config.ui = {
    select = "rex";
    input = "rex";
  };

  keymaps = [
    (pick "<leader><space>" "files" "Find Project Files")
    (pick "<leader>/" "grep" "Grep (Root Dir)")
    (pick "<leader>:" "command_history" "Command History")
    (pick "<leader>b" "buffers" "Buffers")
    (pick "<leader>sS" "lsp_workspace_symbols" "Goto Symbol (Workspace)")
    (pick "<leader>sd" "diagnostics" "Diagnostics")
    (pick "gd" "lsp_definitions" "Goto Definition")
  ];
}
