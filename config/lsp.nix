{
  plugins.lsp = {
    enable = true;
    servers = {
      clangd = {
        enable = true;
        packageFallback = true;
      };
      lua_ls.enable = true;
      nixd.enable = true;
      pyright.enable = true;
      ruff.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
        settings = {
          checkOnSave = true;
          check.command = "clippy";
        };
      };
    };
  };
}
