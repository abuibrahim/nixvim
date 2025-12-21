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

  autoCmd = [
    {
      event = [ "LspProgress" ];
      desc = "Pipe LSP progress directly to Ghostty OSC 9;4 progress bar";
      callback = {
        __raw = ''
          function(ev)
            local client = vim.lsp.get_client_by_id(ev.data.client_id)
            if not client then return end

            local value = ev.data.params.value
            if not value then return end

            -- OSC 9;4;<type>;<percentage>\27\\
            -- Types: 0 = clear, 1 = static, 3 = indeterminate pulsing
            if value.kind == "begin" then
              -- Initialize pulsing bar on start
              vim.api.nvim_ui_send("\27]9;4;3;\27\\")
            elseif value.kind == "report" then
              if value.percentage then
                -- Update to a static percentage bar if data exists
                vim.api.nvim_ui_send(string.format("\27]9;4;1;%d\27\\", value.percentage))
              end
            elseif value.kind == "end" then
              -- Clear the progress bar when finished
              vim.api.nvim_ui_send("\27]9;4;0;\27\\")
            end
          end
        '';
      };
    }
  ];
}
