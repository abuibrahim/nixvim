{
  plugins.lsp = {
    enable = true;

    keymaps = {
      silent = true;

      diagnostic = {
        "<leader>cd" = {
          action = "open_float";
          desc = "Line Diagnostics";
        };
      };

      extra = [
        {
          key = "gd";
          action = "<cmd>Telescope lsp_definitions<cr>";
          options.desc = "Goto Definition";
          mode = "n";
        }
      ];
    };

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
