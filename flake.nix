{
  description = "My NixVim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      flake-utils,
      ...
    }:
    let
      config = import ./config; # import the module directly
      # Enable unfree packages
      nixpkgsConfig = {
        allowUnfree = true;
      };
    in
    {
      nixvimModule = config;
    }
    // flake-utils.lib.eachDefaultSystem (
      system:
      let
        nixvimLib = nixvim.lib.${system};
        pkgs = import nixpkgs {
          inherit system;
          config = nixpkgsConfig;
        };
        nixvim' = nixvim.legacyPackages.${system};
        nvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = config;
          # You can use `extraSpecialArgs` to pass additional arguments to your module files
          extraSpecialArgs = {
            inherit self;
          };
        };
      in
      {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          default = nixvimLib.check.mkTestDerivationFromNvim {
            inherit nvim;
            name = "nvim";
          };

          assertions = pkgs.runCommand "nvim-assertions" { } ''
            export HOME="$(mktemp -d)"
            export XDG_CONFIG_HOME="$HOME/.config"
            export XDG_DATA_HOME="$HOME/.local/share"
            export XDG_STATE_HOME="$HOME/.local/state"
            export XDG_CACHE_HOME="$HOME/.cache"
            ${nvim}/bin/nvim --headless -c 'luafile ${./checks/assertions.lua}' </dev/null
            touch "$out"
          '';
        };

        packages = {
          # Lets you run `nix run .` to start nixvim
          default = nvim;
        };

        formatter = pkgs.nixfmt;
      }
    );
}
