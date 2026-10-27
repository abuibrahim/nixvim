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

  autoCmd = [
    {
      event = [ "LspProgress" ];
      desc = "Pipe LSP progress directly to Ghostty OSC 9;4 progress bar";
      callback = {
        __raw = ''
          (function()
            -- In-flight progress tokens, keyed by client and token, so one
            -- server finishing does not clear the bar while another works.
            local active = {}

            return function(ev)
              local value = ev.data.params.value
              if type(value) ~= "table" then return end
              local key = ev.data.client_id .. ":" .. tostring(ev.data.params.token)

              -- OSC 9;4;<type>;<percentage>\27\\
              -- Types: 0 = clear, 1 = static, 3 = indeterminate pulsing
              if value.kind == "begin" then
                -- Initialize pulsing bar on start
                active[key] = true
                vim.api.nvim_ui_send("\27]9;4;3;\27\\")
              elseif value.kind == "report" then
                if value.percentage then
                  -- Update to a static percentage bar if data exists
                  vim.api.nvim_ui_send(string.format("\27]9;4;1;%d\27\\", value.percentage))
                end
              elseif value.kind == "end" then
                -- Clear the progress bar once nothing is left in flight
                active[key] = nil
                if next(active) == nil then
                  vim.api.nvim_ui_send("\27]9;4;0;\27\\")
                end
              end
            end
          end)()
        '';
      };
    }
  ];
}
