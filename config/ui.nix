{
  autoCmd = [
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
