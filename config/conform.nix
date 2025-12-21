{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      notify_on_error = true;
      format_on_save = ''
        function(bufnr)
          -- Disable with a global or buffer-local variable
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 500, lsp_format = 'fallback' }
        end
      '';
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>uf";
      action = ":FormatToggle<CR>";
      options = {
        desc = "Toggle Format Globally";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>uF";
      action = ":FormatToggle!<CR>";
      options = {
        desc = "Toggle Format Locally";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format()<CR>";
      options = {
        desc = "Format Buffer";
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<leader>cF";
      action = "<cmd>lua require('conform').format()<CR>";
      options = {
        desc = "Format Lines";
        silent = true;
      };
    }
  ];
}
