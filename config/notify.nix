{
  plugins.notify = {
    enable = true;
    settings = {
      topDown = true;
      backgroundColour = "#000000";
      fps = 60;
      render = "default";
      timeout = 500;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>un";
      action = ''
        <cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>
      '';
      options = {
        desc = "Dismiss All Notifications";
      };
    }
    {
      mode = "n";
      key = "<leader>uh";
      action = "<cmd>lua ToggleInlayHints()<CR>";
      options = {
        silent = true;
        desc = "Toggle Inlay Hints";
      };
    }
  ];

  extraConfigLua = ''
    local notify = require("notify")

    local function show_notification(message, level, title)
      notify(message, level, { title = title or "nixvim" })
    end

    function ToggleLineNumber()
      if vim.wo.number then
        vim.wo.number = false
        show_notification("Line numbers disabled", "info")
      else
        vim.wo.number = true
        vim.wo.relativenumber = false
        show_notification("Line numbers enabled", "info")
      end
    end

    function ToggleRelativeLineNumber()
      if vim.wo.relativenumber then
        vim.wo.relativenumber = false
        show_notification("Relative line numbers disabled", "info")
      else
        vim.wo.relativenumber = true
        vim.wo.number = false
        show_notification("Relative line numbers enabled", "info")
      end
    end

    function ToggleWrap()
      if vim.wo.wrap then
        vim.wo.wrap = false
        show_notification("Wrap disabled", "info")
      else
        vim.wo.wrap = true
        show_notification("Wrap enabled", "info")
      end
    end

    function ToggleInlayHints()
      local is_enabled = vim.lsp.inlay_hint.is_enabled()
      vim.lsp.inlay_hint.enable(not is_enabled)
      if is_enabled then
        show_notification("Inlay Hints disabled", "info")
      else
        show_notification("Inlay Hints enabled", "info")
      end
    end

    vim.api.nvim_create_autocmd("BufReadPost", {
      desc = "Disable autoformat-on-save for nixpkgs buffers",
      callback = function(args)
        local path = vim.api.nvim_buf_get_name(args.buf)
        if path == "" then
          return
        end

        local root = vim.fs.root(path, { ".git", "flake.nix" })
        if root and root:match("nixpkgs$") then
          vim.b[args.buf].disable_autoformat = true
          show_notification("Autoformat-on-save disabled for nixpkgs", "info", "conform.nvim")
        end
      end,
    })

    vim.api.nvim_create_user_command("FormatToggle", function(args)
      local scope = args.bang and "this buffer" or "globally"

      if args.bang then
        vim.b.disable_autoformat = not vim.b.disable_autoformat
      else
        vim.g.disable_autoformat = not vim.g.disable_autoformat
      end

      local disabled = args.bang and vim.b.disable_autoformat or vim.g.disable_autoformat
      show_notification(
        ("Autoformat-on-save %s for %s"):format(disabled and "disabled" or "enabled", scope),
        "info",
        "conform.nvim"
      )
    end, {
      desc = "Toggle autoformat-on-save",
      bang = true,
    })
  '';
}
