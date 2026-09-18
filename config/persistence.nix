{
  plugins.persistence.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>qs";
      action = "<cmd>lua require('persistence').load()<CR>";
      options = {
        silent = true;
        desc = "Restore Session";
      };
    }
    {
      mode = "n";
      key = "<leader>ql";
      action = "<cmd>lua require('persistence').load({ last = true })<CR>";
      options = {
        silent = true;
        desc = "Restore Last Session";
      };
    }
    {
      mode = "n";
      key = "<leader>qS";
      action = "<cmd>lua require('persistence').select()<CR>";
      options = {
        silent = true;
        desc = "Select Session";
      };
    }
    {
      mode = "n";
      key = "<leader>qd";
      action = "<cmd>lua require('persistence').stop()<CR>";
      options = {
        silent = true;
        desc = "Don't Save Current Session";
      };
    }
  ];
}
