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

  plugins.dropbar.enable = true;
}
