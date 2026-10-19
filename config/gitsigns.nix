{
  plugins.gitsigns = {
    enable = true;
    settings.trouble = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "]h";
      action.__raw = ''
        function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            require("gitsigns").nav_hunk("next")
          end
        end
      '';
      options = {
        silent = true;
        desc = "Next Hunk";
      };
    }
    {
      mode = "n";
      key = "[h";
      action.__raw = ''
        function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            require("gitsigns").nav_hunk("prev")
          end
        end
      '';
      options = {
        silent = true;
        desc = "Previous Hunk";
      };
    }
    {
      mode = "n";
      key = "]H";
      action.__raw = "function() require('gitsigns').nav_hunk('last') end";
      options = {
        silent = true;
        desc = "Last Hunk";
      };
    }
    {
      mode = "n";
      key = "[H";
      action.__raw = "function() require('gitsigns').nav_hunk('first') end";
      options = {
        silent = true;
        desc = "First Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>Gitsigns blame_line<CR>";
      options = {
        silent = true;
        desc = "Blame Line";
      };
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>Gitsigns diffthis<CR>";
      options = {
        silent = true;
        desc = "Diff This";
      };
    }
    {
      mode = "n";
      key = "<leader>gp";
      action = "<cmd>Gitsigns preview_hunk<CR>";
      options = {
        silent = true;
        desc = "Preview Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>gr";
      action = "<cmd>Gitsigns reset_hunk<CR>";
      options = {
        silent = true;
        desc = "Reset Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>gR";
      action = "<cmd>Gitsigns reset_buffer<CR>";
      options = {
        silent = true;
        desc = "Reset Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>Gitsigns stage_hunk<CR>";
      options = {
        silent = true;
        desc = "Stage Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>gS";
      action = "<cmd>Gitsigns stage_buffer<CR>";
      options = {
        silent = true;
        desc = "Stage Buffer";
      };
    }
  ];
}
