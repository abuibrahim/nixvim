{
  plugins = {
    gitsigns = {
      enable = true;
      settings = {
        trouble = true;
      };
    };
    trouble.enable = true;
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
      action = "<cmd>lua require('gitsigns').nav_hunk('last')<CR>";
      options = {
        silent = true;
        desc = "Last Hunk";
      };
    }
    {
      mode = "n";
      key = "[H";
      action = "<cmd>lua require('gitsigns').nav_hunk('first')<CR>";
      options = {
        silent = true;
        desc = "First Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = ":Gitsigns blame_line<CR>";
      options = {
        silent = true;
        desc = "Blame Line";
      };
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = ":Gitsigns diffthis<CR>";
      options = {
        silent = true;
        desc = "Diff This";
      };
    }
    {
      mode = "n";
      key = "<leader>gp";
      action = ":Gitsigns preview_hunk<CR>";
      options = {
        silent = true;
        desc = "Preview Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>gr";
      action = ":Gitsigns reset_hunk<CR>";
      options = {
        silent = true;
        desc = "Reset Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>gR";
      action = ":Gitsigns reset_buffer<CR>";
      options = {
        silent = true;
        desc = "Reset Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = ":Gitsigns stage_hunk<CR>";
      options = {
        silent = true;
        desc = "Stage Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>gS";
      action = ":Gitsigns stage_buffer<CR>";
      options = {
        silent = true;
        desc = "Stage Buffer";
      };
    }
  ];
}
