{
  plugins.neo-tree = {
    enable = true;
    settings = {
      close_if_last_window = true;
      enable_modified_markers = true;
      enable_git_status = true;
      enable_refresh_on_write = true;
      popup_border_style = "rounded";
      filesystem.follow_current_file = {
        enable = true;
        leave_dirs_open = true;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<C-t>";
      action = ":Neotree toggle<CR>";
      options = {
        silent = true;
        desc = "Toggle Neotree";
      };
    }
  ];
}
