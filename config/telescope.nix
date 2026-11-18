let
  pick = action: desc: {
    inherit action;
    options = {
      silent = true;
      inherit desc;
    };
  };
in
{
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
    };
    keymaps = {
      "<leader><space>" = pick "find_files" "Find Project Files";
      "<leader>/" = pick "live_grep" "Grep (Root Dir)";
      "<leader>:" = pick "command_history" "Command History";
      "<leader>b" = pick "buffers" "Buffers";
      # LSP-powered search (only useful with a server attached, harmless otherwise)
      "<leader>ss" = pick "lsp_document_symbols" "Goto Symbol (Document)";
      "<leader>sS" = pick "lsp_dynamic_workspace_symbols" "Goto Symbol (Workspace)";
      "<leader>sd" = pick "diagnostics" "Diagnostics";
    };
  };
}
