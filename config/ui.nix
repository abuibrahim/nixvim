{
  autoCmd = [
    {
      event = [ "FileType" ];
      pattern = [ "snacks_dashboard" ];
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
    # colorrex re-applies the colorscheme once the terminal reports its
    # palette, after snacks has hidden the statusline for the dashboard.
    # lualine reruns its setup on ColorScheme and on 'background' changes,
    # which forces laststatus back to 3, so hide it again while the
    # dashboard is still showing.
    {
      event = [ "ColorScheme" ];
      pattern = [ "*" ];
      desc = "Keep the statusline hidden on the dashboard";
      callback.__raw = ''
        function()
          vim.schedule(function()
            if vim.bo.filetype == "snacks_dashboard" then
              vim.o.laststatus = 0
            end
          end)
        end
      '';
    }
    {
      event = [ "OptionSet" ];
      pattern = [ "background" ];
      desc = "Keep the statusline hidden on the dashboard";
      callback.__raw = ''
        function()
          vim.schedule(function()
            if vim.bo.filetype == "snacks_dashboard" then
              vim.o.laststatus = 0
            end
          end)
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
    noice = {
      enable = true;
      settings.notify.enabled = false;
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
