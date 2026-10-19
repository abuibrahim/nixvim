{
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
    };

    keymaps = {
      "<leader><space>" = {
        action = "find_files";
        options = {
          silent = true;
          desc = "Find Project Files";
        };
      };
      "<leader>/" = {
        action = "live_grep";
        options = {
          silent = true;
          desc = "Grep (Root Dir)";
        };
      };
      "<leader>:" = {
        action = "command_history";
        options = {
          silent = true;
          desc = "Command History";
        };
      };
      "<leader>b" = {
        action = "buffers";
        options = {
          silent = true;
          desc = "Buffers";
        };
      };

      # LSP-powered search (only useful with a server attached, harmless otherwise)
      "<leader>ss" = {
        action = "lsp_document_symbols";
        options = {
          silent = true;
          desc = "Goto Symbol (Document)";
        };
      };
      "<leader>sS" = {
        action = "lsp_dynamic_workspace_symbols";
        options = {
          silent = true;
          desc = "Goto Symbol (Workspace)";
        };
      };
      "<leader>sd" = {
        action = "diagnostics";
        options = {
          silent = true;
          desc = "Diagnostics";
        };
      };
    };
  };
}
