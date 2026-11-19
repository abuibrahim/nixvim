{
  plugins.snacks.settings.notifier.enabled = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>un";
      action = "<cmd>lua Snacks.notifier.hide()<CR>";
      options.desc = "Dismiss All Notifications";
    }
  ];
}
