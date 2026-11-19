{
  plugins.lsp = {
    enable = true;

    keymaps.extra = [
      {
        mode = "n";
        key = "gd";
        action = "<cmd>lua require('neorex.pick').lsp_definitions()<CR>";
        options.desc = "Goto Definition";
      }
    ];

    servers = {
      clangd = {
        enable = true;
        packageFallback = true;
      };
      dts_lsp.enable = true;
      lua_ls.enable = true;
      nixd.enable = true;
      pyright = {
        enable = true;
        packageFallback = true;
      };
      ruff = {
        enable = true;
        packageFallback = true;
      };
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
