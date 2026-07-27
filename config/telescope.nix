{
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native = {
        enable = true;
        settings = {
          fuzzy = true;
        };
      };
      ui-select = {
        enable = true;
      };
    };

    keymaps = {
      "<leader><space>" = {
        action = "find_files";
        options.desc = "Find project files";
      };
      "<leader>/" = {
        action = "live_grep";
        options.desc = "Grep (root dir)";
      };
      "<leader>:" = {
        action = "command_history";
        options.desc = "Command history";
      };
      "<leader>b" = {
        action = "buffers";
        options.desc = "+buffer";
      };

      # LSP-powered search (only useful with a server attached, harmless otherwise)
      "<leader>ss" = {
        action = "lsp_document_symbols";
        options.desc = "Goto Symbol (document)";
      };
      "<leader>sS" = {
        action = "lsp_dynamic_workspace_symbols";
        options.desc = "Goto Symbol (workspace)";
      };
      "<leader>sd" = {
        action = "diagnostics";
        options.desc = "Diagnostics";
      };
    };
  };
}
