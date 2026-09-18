{
  autoCmd = [
    {
      event = [ "FileType" ];
      pattern = [ "alpha" ];
      desc = "Hide the tabline and fold column on the dashboard";
      callback.__raw = ''
        function()
          vim.opt_local.showtabline = 0
          vim.opt_local.foldcolumn = "0"
          vim.api.nvim_create_autocmd("BufUnload", {
            buffer = 0,
            once = true,
            callback = function()
              vim.opt.showtabline = 2
            end,
          })
        end
      '';
    }
    {
      event = [ "FileType" ];
      pattern = [
        "nix"
        "lua"
        "python"
        "rust"
        "c"
        "cpp"
        "sh"
      ];
      desc = "Show the colorcolumn only in code buffers";
      callback.__raw = ''
        function()
          vim.opt_local.colorcolumn = "80"
        end
      '';
    }
  ];

  plugins = {
    alpha = {
      enable = true;
      theme = null;
      settings = {
        layout = [
          {
            type = "padding";
            val = 4;
          }
          {
            opts = {
              hl = "AlphaHeader";
              position = "center";
            };
            type = "text";
            val = [
              "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
              "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
              "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
              "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
              "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
              "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
              "                                            "
            ];
          }
          {
            type = "padding";
            val = 2;
          }
          {
            type = "button";
            val = "  Find File";
            on_press = {
              __raw = "function() require('telescope.builtin').find_files() end";
            };
            opts = {
              keymap = [
                "n"
                "f"
                ":Telescope find_files <CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "f";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "padding";
            val = 1;
          }
          {
            type = "button";
            val = "  New File";
            on_press = {
              __raw = "function() vim.cmd[[ene]] end";
            };
            opts = {
              keymap = [
                "n"
                "n"
                ":ene <BAR> startinsert <CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "n";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "padding";
            val = 1;
          }
          {
            type = "button";
            val = "󰈚  Recent Files";
            on_press = {
              __raw = "function() require('telescope.builtin').oldfiles() end";
            };
            opts = {
              keymap = [
                "n"
                "r"
                ":Telescope oldfiles <CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "r";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "padding";
            val = 1;
          }
          {
            type = "button";
            val = "󰈭  Find Word";
            on_press = {
              __raw = "function() require('telescope.builtin').live_grep() end";
            };
            opts = {
              keymap = [
                "n"
                "g"
                ":Telescope live_grep <CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "g";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "padding";
            val = 1;
          }
          {
            type = "button";
            val = "  Quit Neovim";
            on_press = {
              __raw = "function() vim.cmd[[qa]] end";
            };
            opts = {
              keymap = [
                "n"
                "q"
                ":qa<CR>"
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = "q";

              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          {
            type = "padding";
            val = 2;
          }
          {
            opts = {
              hl = "AlphaFooter";
              position = "center";
            };
            type = "text";
            val.__raw = ''function() return os.date("󰃭  %A, %d %B %Y") end'';
          }
        ];
      };
    };
    noice = {
      enable = true;
      settings.routes = [
        {
          filter = {
            event = "notify";
            find = "No information available";
          };
          opts.skip = true;
        }
      ];
    };
    dropbar.enable = true;
  };
}
