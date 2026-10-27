{
  plugins.conform-nvim = {
    enable = true;
    autoInstall.enable = true;

    settings = {
      formatters_by_ft = {
        nix = [ "nixfmt" ];
        lua = [ "stylua" ];
        json = [ "jq" ];
        sh = [ "shfmt" ];
        "_" = [ "trim_whitespace" ];
      };

      format_on_save = ''
        function(bufnr)
          -- Disable with a global or buffer-local variable
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 500, lsp_format = 'fallback' }
        end
      '';
    };

    # Formatted by their language servers (ruff, rust-analyzer, clangd).
    # Without an entry these would match "_", and its formatter would stop
    # lsp_format = "fallback" from ever reaching the server. Set after setup
    # because autoInstall reads every string under formatters_by_ft as a
    # formatter name, "prefer" included.
    luaConfig.post = ''
      for _, ft in ipairs({ "python", "rust", "c", "cpp" }) do
        require("conform").formatters_by_ft[ft] = { lsp_format = "prefer" }
      end
    '';
  };

  userCommands.FormatToggle = {
    desc = "Toggle autoformat-on-save";
    bang = true;
    command.__raw = ''
      function(args)
        local scope = args.bang and "this buffer" or "globally"

        if args.bang then
          vim.b.disable_autoformat = not vim.b.disable_autoformat
        else
          vim.g.disable_autoformat = not vim.g.disable_autoformat
        end

        local disabled = args.bang and vim.b.disable_autoformat or vim.g.disable_autoformat
        vim.notify(
          ("Autoformat-on-save %s for %s"):format(disabled and "disabled" or "enabled", scope),
          vim.log.levels.INFO,
          { title = "conform.nvim" }
        )
      end
    '';
  };

  autoCmd = [
    {
      event = [ "BufReadPost" ];
      desc = "Disable autoformat-on-save for nixpkgs buffers";
      callback.__raw = ''
        function(args)
          local path = vim.api.nvim_buf_get_name(args.buf)
          if path == "" then
            return
          end

          local root = vim.fs.root(path, { ".git", "flake.nix" })
          if root and root:match("nixpkgs$") then
            vim.b[args.buf].disable_autoformat = true
            vim.notify("Autoformat-on-save disabled for nixpkgs", vim.log.levels.INFO, { title = "conform.nvim" })
          end
        end
      '';
    }
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>uf";
      action = "<cmd>FormatToggle<CR>";
      options = {
        silent = true;
        desc = "Toggle Format Globally";
      };
    }
    {
      mode = "n";
      key = "<leader>uF";
      action = "<cmd>FormatToggle!<CR>";
      options = {
        silent = true;
        desc = "Toggle Format Locally";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cf";
      action.__raw = "function() require('conform').format() end";
      options = {
        silent = true;
        desc = "Format Buffer/Selection";
      };
    }
  ];
}
