{
  plugins.gitsigns.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "]h";
      options.desc = "Next Hunk";
      action.__raw = ''
        function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            require("gitsigns").nav_hunk("next")
          end
        end
      '';
    }
    {
      mode = "n";
      key = "[h";
      options.desc = "Previous Hunk";
      action.__raw = ''
        function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            require("gitsigns").nav_hunk("prev")
          end
        end
      '';
    }
    {
      mode = "n";
      key = "]H";
      action = "<cmd>lua require('gitsigns').nav_hunk('last')<CR>";
      options.desc = "Last Hunk";
    }
    {
      mode = "n";
      key = "[H";
      action = "<cmd>lua require('gitsigns').nav_hunk('first')<CR>";
      options.desc = "First Hunk";
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>Gitsigns blame_line<CR>";
      options.desc = "Blame Line";
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>Gitsigns diffthis<CR>";
      options.desc = "Diff This";
    }
    {
      mode = "n";
      key = "<leader>gp";
      action = "<cmd>Gitsigns preview_hunk<CR>";
      options.desc = "Preview Hunk";
    }
    {
      mode = "n";
      key = "<leader>gr";
      action = "<cmd>Gitsigns reset_hunk<CR>";
      options.desc = "Reset Hunk";
    }
    {
      mode = "n";
      key = "<leader>gR";
      action = "<cmd>Gitsigns reset_buffer<CR>";
      options.desc = "Reset Buffer";
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>Gitsigns stage_hunk<CR>";
      options.desc = "Stage Hunk";
    }
    {
      mode = "n";
      key = "<leader>gS";
      action = "<cmd>Gitsigns stage_buffer<CR>";
      options.desc = "Stage Buffer";
    }
  ];
}
