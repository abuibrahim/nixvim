{ pkgs, ... }:
let
  fadein = pkgs.vimUtils.buildVimPlugin {
    pname = "fadein.nvim";
    version = "0-unstable-2026-11-01";
    src = pkgs.fetchFromGitHub {
      owner = "CruelAddict";
      repo = "fadein.nvim";
      rev = "c84dc66809669defd23e147642d034570c671db6";
      hash = "sha256-WwrpjftyFFqlvXIGukGYl2PFHR4advJXP8CPsWBow+8=";
    };
    dependencies = [ pkgs.vimPlugins.snacks-nvim ];
    meta = {
      description = "Neovim startup dashboard logo with a short animation";
      homepage = "https://github.com/CruelAddict/fadein.nvim";
      license = pkgs.lib.licenses.mit;
    };
  };
in
{
  extraPlugins = [ fadein ];

  plugins.snacks = {
    enable = true;
    settings.dashboard = {
      enabled = true;
      preset.keys.__raw = ''
        {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load()" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        }
      '';
      sections.__raw = ''
        {
          require("fadein").section({ animation = "n" }),
          { section = "keys", gap = 1, padding = 2 },
        }
      '';
    };
  };
}
