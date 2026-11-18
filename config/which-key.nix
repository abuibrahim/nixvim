let
  group = mode: key: name: {
    __unkeyed-1 = key;
    inherit mode;
    group = name;
  };
  nv = [
    "n"
    "v"
  ];
  n = [ "n" ];
in
{
  plugins = {
    which-key = {
      enable = true;
      settings = {
        icons = {
          breadcrumb = "»";
          group = "";
          separator = "➜";
        };
        spec = [
          (group nv "<leader>c" "code")
          (group nv "<leader>g" "git")
          (group n "<leader>s" "search")
          (group n "<leader>q" "quit/session")
          (group nv "gs" "surround")
          (group n "<leader>u" "ui")
        ];
      };
    };
    mini-icons = {
      enable = true;
      mockDevIcons = true;
    };
  };
}
