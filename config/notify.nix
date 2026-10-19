{
  plugins.notify = {
    enable = true;
    settings = {
      background_colour = "#000000";
      fps = 60;
      render = "default";
      timeout = 500;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>un";
      action.__raw = "function() require('notify').dismiss({ silent = true, pending = true }) end";
      options = {
        silent = true;
        desc = "Dismiss All Notifications";
      };
    }
  ];
}
