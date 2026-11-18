let
  inherit (import ./map.nix) nmap lua;
in
{
  plugins.snacks.settings.notifier.enabled = true;

  keymaps = [
    (nmap "<leader>un" (lua "function() Snacks.notifier.hide() end") "Dismiss All Notifications")
  ];
}
