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
            group = "+quit/session";
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
        win = {
          #border = "none";
        };
      };
    };
    mini-icons.enable = true;
  };
}
