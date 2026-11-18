{ pkgs, ... }:
{
  # for Neovim's own TUI; in neorex, its own runtime goes first
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "neorex-runtime";
      version = "0-unstable-2026-11-17";
      src =
        pkgs.fetchFromGitHub {
          owner = "alexrlocke";
          repo = "neorex";
          rev = "2f61174865787ec4d9fe35d3a5733526fb6fa015";
          hash = "sha256-4sDsx75qID4jgIQZM298uSs1Qp6Yhvq3ikepahUhSMg=";
        }
        + "/runtime";
      meta.license = pkgs.lib.licenses.mit;
    })
  ];
  extraConfigLuaPre = ''
    if vim.g.neorex_runtime then
      vim.opt.rtp:prepend(vim.g.neorex_runtime)
    end
  '';
  colorscheme = "neorex";
  # the palette needs it off in the TUI and on in neorex
  opts.termguicolors.__raw = "vim.g.neorex == true";
}
