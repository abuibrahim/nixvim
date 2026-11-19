{
  # the pickers and vim.ui open in Rex's command palette
  globals.neorex_config.ui = {
    select = "rex";
    input = "rex";
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader><space>";
      action = "<cmd>lua require('neorex.pick').files()<CR>";
      options.desc = "Find Project Files";
    }
    {
      mode = "n";
      key = "<leader>/";
      action = "<cmd>lua require('neorex.pick').grep()<CR>";
      options.desc = "Grep (Root Dir)";
    }
    {
      mode = "n";
      key = "<leader>:";
      action = "<cmd>lua require('neorex.pick').command_history()<CR>";
      options.desc = "Command History";
    }
    {
      mode = "n";
      key = "<leader>b";
      action = "<cmd>lua require('neorex.pick').buffers()<CR>";
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<leader>sS";
      action = "<cmd>lua require('neorex.pick').lsp_workspace_symbols()<CR>";
      options.desc = "Goto Symbol (Workspace)";
    }
    {
      mode = "n";
      key = "<leader>sd";
      action = "<cmd>lua require('neorex.pick').diagnostics()<CR>";
      options.desc = "Diagnostics";
    }
  ];
}
