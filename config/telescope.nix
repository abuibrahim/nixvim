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
    };
  };
}
