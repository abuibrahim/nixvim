{
  plugins.lualine = {
    enable = true;
    settings.sections = {
      lualine_a = [ "mode" ];
      lualine_b = [
        "branch"
        "diff"
      ];
      lualine_c = [ "diagnostics" ];
      lualine_x.__raw = "{}";
      lualine_y = [ "progress" ];
      lualine_z = [ "location" ];
    };
  };
}
