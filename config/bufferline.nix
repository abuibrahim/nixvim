{
  plugins = {
    bufferline = {
      enable = true;
      settings = {
        highlights.__raw = "require('catppuccin.special.bufferline').get_theme()";
        options = {
          diagnostics = "nvim_lsp";
          show_close_icon = false;
        };
      };
    };
  };
}
