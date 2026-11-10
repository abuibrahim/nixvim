{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "colorrex.nvim";
      version = "0-unstable-2026-11-09";
      src = pkgs.fetchFromGitHub {
        owner = "reklai";
        repo = "colorrex.nvim";
        rev = "fa64752aec51520d05755a6336e17798e501907e";
        hash = "sha256-ATaDWXnKaSO+Kqzpds9j/6PCnTDMW5ll2n8BT4ezg4A=";
      };
      meta.license = pkgs.lib.licenses.mit;
    })
  ];
  colorscheme = "colorrex";
}
