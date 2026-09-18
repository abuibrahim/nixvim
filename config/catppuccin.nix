{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      default_integrations = true;
      dim_inactive = {
        enabled = false;
        percentage = 0.25;
      };

      flavour = "mocha";

      float = {
        transparent = true;
        solid = false;
      };

      integrations = {
        indent_blankline = {
          enabled = true;
          colored_indent_levels = true;
        };
        blink_pairs = true;
        lsp_trouble = true;
        noice = true;
        notify = true;
        telescope.enabled = true;
        which_key = true;
      };

      show_end_of_buffer = true;
      term_colors = true;
      transparent_background = true;
    };
  };
}
