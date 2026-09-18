{ config, ... }:
{
  plugins = {
    treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;
      folding.enable = true;

      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        bash
        c
        cpp
        diff
        git_config
        git_rebase
        gitcommit
        gitignore
        json
        lua
        luadoc
        make
        markdown
        markdown_inline
        nix
        printf
        python
        query
        regex
        rust
        ssh_config
        toml
        vim
        vimdoc
        yaml
      ];
    };
  };
}
