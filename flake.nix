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
        pkgs = import nixpkgs {
          inherit system;
          config = nixpkgsConfig;
        };
        configuration = nixvim.lib.evalNixvim {
          modules = [
            config
            { nixpkgs.pkgs = pkgs; }
          ];
        };
        nvim = configuration.config.build.package;
      in
      {
        checks = {
          default = configuration.config.build.test;
        };

        packages = {
          default = nvim;
        };

        formatter = pkgs.nixfmt;
      }
    );
}
