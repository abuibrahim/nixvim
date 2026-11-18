let
  inherit (import ./map.nix) nmap lua;
in
{
  plugins.persistence.enable = true;

  keymaps = [
    (nmap "<leader>qs" (lua "function() require('persistence').load() end") "Restore Session")
    (nmap "<leader>ql" (lua "function() require('persistence').load({ last = true }) end")
      "Restore Last Session"
    )
    (nmap "<leader>qS" (lua "function() require('persistence').select() end") "Select Session")
    (nmap "<leader>qd" (lua "function() require('persistence').stop() end")
      "Don't Save Current Session"
    )
  ];
}
