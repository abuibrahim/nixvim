{
  plugins.persistence.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>qs";
      action = "<cmd>lua require('persistence').load()<CR>";
      options.desc = "Restore Session";
    }
    {
      mode = "n";
      key = "<leader>ql";
      action = "<cmd>lua require('persistence').load({ last = true })<CR>";
      options.desc = "Restore Last Session";
    }
    {
      mode = "n";
      key = "<leader>qS";
      action = "<cmd>lua require('persistence').select()<CR>";
      options.desc = "Select Session";
    }
    {
      mode = "n";
      key = "<leader>qd";
      action = "<cmd>lua require('persistence').stop()<CR>";
      options.desc = "Don't Save Current Session";
    }
  ];
}
