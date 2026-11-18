let
  inherit (import ./map.nix) nmap lua;
  pick = key: source: nmap key (lua "function() Snacks.picker.${source}() end");
in
{
  # neorex fits a snacks picker to its Rex floating pane, which it can't do
  # for telescope's separate windows
  plugins.snacks.settings.picker.enabled = true;

  keymaps = [
    (pick "<leader><space>" "files" "Find Project Files")
    (pick "<leader>/" "grep" "Grep (Root Dir)")
    (pick "<leader>:" "command_history" "Command History")
    (pick "<leader>b" "buffers" "Buffers")
    (pick "<leader>ss" "lsp_symbols" "Goto Symbol (Document)")
    (pick "<leader>sS" "lsp_workspace_symbols" "Goto Symbol (Workspace)")
    (pick "<leader>sd" "diagnostics" "Diagnostics")
  ];
}
