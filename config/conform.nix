{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lsp_format = "fallback";
      };
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
