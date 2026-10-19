{
  plugins.persistence.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>qs";
      action.__raw = "function() require('persistence').load() end";
      options = {
        silent = true;
        desc = "Restore Session";
      };
    }
    {
      mode = "n";
      key = "<leader>ql";
      action.__raw = "function() require('persistence').load({ last = true }) end";
      options = {
        silent = true;
        desc = "Restore Last Session";
      };
    }
    {
      mode = "n";
      key = "<leader>qS";
      action.__raw = "function() require('persistence').select() end";
      options = {
        silent = true;
        desc = "Select Session";
      };
    }
    {
      mode = "n";
      key = "<leader>qd";
      action.__raw = "function() require('persistence').stop() end";
      options = {
        silent = true;
        desc = "Don't Save Current Session";
      };
    }
  ];
}
