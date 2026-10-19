{
  keymaps = [

    # Tabs
    {
      mode = "n";
      key = "<leader><tab>f";
      action = "<cmd>tabfirst<CR>";
      options = {
        silent = true;
        desc = "First Tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>l";
      action = "<cmd>tablast<CR>";
      options = {
        silent = true;
        desc = "Last Tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab><tab>";
      action = "<cmd>tabnew<CR>";
      options = {
        silent = true;
        desc = "New Tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>[";
      action = "<cmd>tabprevious<CR>";
      options = {
        silent = true;
        desc = "Previous Tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>]";
      action = "<cmd>tabnext<CR>";
      options = {
        silent = true;
        desc = "Next Tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>d";
      action = "<cmd>tabclose<CR>";
      options = {
        silent = true;
        desc = "Close Tab";
      };
    }

    # Windows
    {
      mode = "n";
      key = "<leader>ww";
      action = "<C-W>p";
      options = {
        silent = true;
        desc = "Other Window";
      };
    }
    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-W>c";
      options = {
        silent = true;
        desc = "Delete Window";
      };
    }
    {
      mode = "n";
      key = "<leader>w-";
      action = "<C-W>s";
      options = {
        silent = true;
        desc = "Split Window Below";
      };
    }
    {
      mode = "n";
      key = "<leader>w|";
      action = "<C-W>v";
      options = {
        silent = true;
        desc = "Split Window Right";
      };
    }

    # Save
    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<CR>";
      options = {
        silent = true;
        desc = "Save File";
      };
    }

    # Quit/Session
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>quitall<CR>";
      options = {
        silent = true;
        desc = "Quit All";
      };
    }

    # Toggle
    {
      mode = "n";
      key = "<leader>ul";
      action.__raw = ''
        function()
          vim.wo.number = not vim.wo.number
          if vim.wo.number then
            vim.wo.relativenumber = false
          end
          vim.notify("Line numbers " .. (vim.wo.number and "enabled" or "disabled"), vim.log.levels.INFO, { title = "nixvim" })
        end
      '';
      options = {
        silent = true;
        desc = "Toggle Line Numbers";
      };
    }
    {
      mode = "n";
      key = "<leader>uL";
      action.__raw = ''
        function()
          vim.wo.relativenumber = not vim.wo.relativenumber
          if vim.wo.relativenumber then
            vim.wo.number = false
          end
          vim.notify("Relative line numbers " .. (vim.wo.relativenumber and "enabled" or "disabled"), vim.log.levels.INFO, { title = "nixvim" })
        end
      '';
      options = {
        silent = true;
        desc = "Toggle Relative Line Numbers";
      };
    }
    {
      mode = "n";
      key = "<leader>uw";
      action.__raw = ''
        function()
          vim.wo.wrap = not vim.wo.wrap
          vim.notify("Wrap " .. (vim.wo.wrap and "enabled" or "disabled"), vim.log.levels.INFO, { title = "nixvim" })
        end
      '';
      options = {
        silent = true;
        desc = "Toggle Line Wrap";
      };
    }
    {
      mode = "n";
      key = "<leader>uh";
      action.__raw = ''
        function()
          local enabled = not vim.lsp.inlay_hint.is_enabled()
          vim.lsp.inlay_hint.enable(enabled)
          vim.notify("Inlay hints " .. (enabled and "enabled" or "disabled"), vim.log.levels.INFO, { title = "nixvim" })
        end
      '';
      options = {
        silent = true;
        desc = "Toggle Inlay Hints";
      };
    }

    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        silent = true;
        desc = "Indent Left";
      };
    }

    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        silent = true;
        desc = "Indent Right";
      };
    }

    # Copy to system clipboard
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>y";
      action = "\"+y";
      options = {
        silent = true;
        desc = "Copy to System Clipboard";
      };
    }

    # Set highlight on search, but clear on <ESC> in normal mode
    {
      mode = "n";
      key = "<ESC>";
      action = "<cmd>nohlsearch<CR>";
      options = {
        silent = true;
        desc = "Clear Search Highlight";
      };
    }

    # Indent blank lines
    {
      mode = "n";
      key = "<leader>ui";
      action = "<cmd>IBLToggle<CR>";
      options = {
        silent = true;
        desc = "Toggle Indent Guides";
      };
    }
    {
      mode = "n";
      key = "<leader>uI";
      action = "<cmd>IBLToggleScope<CR>";
      options = {
        silent = true;
        desc = "Toggle Indent Scope";
      };
    }
  ];
}
