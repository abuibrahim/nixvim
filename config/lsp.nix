{
  plugins.lsp = {
    enable = true;

    # Buffer-local keymaps, applied on LspAttach.
    #
    # Neovim 0.11+ already provides sensible defaults (grn rename, gra code
    # action, grr references, gri implementation, grt type def, gO symbols,
    # K hover, [d/]d/<C-w>d diagnostics). Below we keep those, but route the
    # list-producing actions through Telescope pickers and mirror the common
    # ones under <leader>c ("+code") so they're discoverable via which-key.
    keymaps = {
      silent = true;

      lspBuf = {
        K = {
          action = "hover";
          desc = "Hover";
        };
        gD = {
          action = "declaration";
          desc = "Goto Declaration";
        };
        "<leader>ca" = {
          action = "code_action";
          desc = "Code Action";
          mode = [
            "n"
            "v"
          ];
        };
        "<leader>cr" = {
          action = "rename";
          desc = "Rename";
        };
      };

      diagnostic = {
        "<leader>cd" = {
          action = "open_float";
          desc = "Line Diagnostics";
        };
      };

      # Telescope-backed navigation (fzf-native + ui-select already enabled).
      # These override the 0.11 quickfix-based defaults for a fuzzy picker UI.
      extra = [
        {
          key = "gd";
          action = "<cmd>Telescope lsp_definitions<cr>";
          options.desc = "Goto Definition";
          mode = "n";
        }
        {
          key = "grr";
          action = "<cmd>Telescope lsp_references<cr>";
          options.desc = "References";
          mode = "n";
        }
        {
          key = "gri";
          action = "<cmd>Telescope lsp_implementations<cr>";
          options.desc = "Goto Implementation";
          mode = "n";
        }
        {
          key = "grt";
          action = "<cmd>Telescope lsp_type_definitions<cr>";
          options.desc = "Goto Type Definition";
          mode = "n";
        }
        {
          key = "gO";
          action = "<cmd>Telescope lsp_document_symbols<cr>";
          options.desc = "Document Symbols";
          mode = "n";
        }
      ];
    };

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
