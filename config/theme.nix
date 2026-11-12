{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "colorrex.nvim";
      version = "0-unstable-2026-11-10";
      src = pkgs.fetchFromGitHub {
        owner = "reklai";
        repo = "colorrex.nvim";
        rev = "bddcaf9f166ef4b88a04797331430ef7b46d46f1";
        hash = "sha256-Th7D2wJOh+lL3GECAZ3YtwgYPOcWiihem+5DIrcigDs=";
      };
      meta.license = pkgs.lib.licenses.mit;
    })
  ];
  colorscheme = "colorrex";
}
