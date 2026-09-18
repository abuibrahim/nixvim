{
  plugins = {
    which-key = {
      enable = true;
      settings = {
        icons = {
          breadcrumb = "»";
          group = "+";
          separator = "➜";
        };
        spec = [
          {
            __unkeyed-1 = "<leader>c";
            mode = [
              "n"
              "v"
            ];
            group = "+code";
          }
          {
            __unkeyed-1 = "<leader>g";
            mode = [
              "n"
              "v"
            ];
            group = "+git";
          }
          {
            __unkeyed-1 = "<leader>s";
            mode = [ "n" ];
            group = "+search";
          }
          {
            __unkeyed-1 = "<leader><Tab>";
            mode = [ "n" ];
            group = "+tab";
          }
          {
            __unkeyed-1 = "<leader>q";
            mode = [ "n" ];
            group = "+quit";
          }
          {
            __unkeyed-1 = "gs";
            mode = [
              "n"
              "v"
            ];
            group = "+surround";
          }
          {
            __unkeyed-1 = "<leader>x";
            mode = [ "n" ];
            group = "+diagnostics/quickfix";
          }
          {
            __unkeyed-1 = "<leader>u";
            mode = [ "n" ];
            group = "+ui";
          }
          {
            __unkeyed-1 = "<leader>w";
            mode = [ "n" ];
            group = "+windows";
          }
        ];
      };
    };
    mini-icons = {
      enable = true;
      mockDevIcons = true;
    };
  };
}
