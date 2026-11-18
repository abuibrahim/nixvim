let
  inherit (import ./map.nix) nmap lua;
in
{
  plugins.gitsigns.enable = true;

  keymaps = [
    (nmap "]h" (lua ''
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          require("gitsigns").nav_hunk("next")
        end
      end
    '') "Next Hunk")
    (nmap "[h" (lua ''
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          require("gitsigns").nav_hunk("prev")
        end
      end
    '') "Previous Hunk")
    (nmap "]H" (lua "function() require('gitsigns').nav_hunk('last') end") "Last Hunk")
    (nmap "[H" (lua "function() require('gitsigns').nav_hunk('first') end") "First Hunk")
    (nmap "<leader>gb" "<cmd>Gitsigns blame_line<CR>" "Blame Line")
    (nmap "<leader>gd" "<cmd>Gitsigns diffthis<CR>" "Diff This")
    (nmap "<leader>gp" "<cmd>Gitsigns preview_hunk<CR>" "Preview Hunk")
    (nmap "<leader>gr" "<cmd>Gitsigns reset_hunk<CR>" "Reset Hunk")
    (nmap "<leader>gR" "<cmd>Gitsigns reset_buffer<CR>" "Reset Buffer")
    (nmap "<leader>gs" "<cmd>Gitsigns stage_hunk<CR>" "Stage Hunk")
    (nmap "<leader>gS" "<cmd>Gitsigns stage_buffer<CR>" "Stage Buffer")
  ];
}
