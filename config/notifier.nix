{
  plugins.snacks.settings.notifier.enabled = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>un";
      action.__raw = "function() Snacks.notifier.hide() end";
      options = {
        silent = true;
        desc = "Dismiss All Notifications";
      };
    }
  ];
}
