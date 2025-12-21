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
      action = "<cmd>w<CR><ESC>";
      options = {
        silent = true;
        desc = "Save File";
      };
    }

    # Quit/Session
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>quitall<CR><ESC>";
      options = {
        silent = true;
        desc = "Quit all";
      };
    }

    # Toggle
    {
      mode = "n";
      key = "<leader>ul";
      action = ":lua ToggleLineNumber()<CR>";
      options = {
        silent = true;
        desc = "Toggle Line Numbers";
      };
    }
    {
      mode = "n";
      key = "<leader>uL";
      action = ":lua ToggleRelativeLineNumber()<CR>";
      options = {
        silent = true;
        desc = "Toggle Relative Line Numbers";
      };
    }
    {
      mode = "n";
      key = "<leader>uw";
      action = ":lua ToggleWrap()<CR>";
      options = {
        silent = true;
        desc = "Toggle Line Wrap";
      };
    }

    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        silent = true;
        desc = "Indent while remaining in visual mode.";
      };
    }

    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        silent = true;
        desc = "Indent while remaining in visual mode.";
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
        desc = "Copy to system clipboard";
      };
    }

    # Set highlight on search, but clear on <ESC> in normal mode
    {
      mode = "n";
      key = "<ESC>";
      action = "<cmd>nohlsearch<CR>";
    }

    # Indent blank lines
    {
      mode = "n";
      key = "<leader>ui";
      action = "<cmd>IBLToggle<CR>";
      options = {
        desc = "Indent-Blankline toggle";
      };
    }
    {
      mode = "n";
      key = "<leader>uI";
      action = "<cmd>IBLToggleScope<CR>";
      options = {
        desc = "Indent-Blankline Scope toggle";
      };
    }
  ];
}
