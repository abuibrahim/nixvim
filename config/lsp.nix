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
      {
        mode = "n";
        key = "grr";
        action = "<cmd>lua require('neorex.pick').lsp_references()<CR>";
        options.desc = "References";
      }
      {
        mode = "n";
        key = "gri";
        action = "<cmd>lua require('neorex.pick').lsp_implementations()<CR>";
        options.desc = "Implementations";
      }
      {
        mode = "n";
        key = "grt";
        action = "<cmd>lua require('neorex.pick').lsp_type_definitions()<CR>";
        options.desc = "Type Definition";
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
      zls = {
        enable = true;
        packageFallback = true;
      };
    };
  };
}
