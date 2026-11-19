{
  keymaps = [
    # Save
    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<CR>";
      options.desc = "Save File";
    }

    # Quit/Session
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>quitall<CR>";
      options.desc = "Quit All";
    }

    {
      mode = "v";
      key = "<";
      action = "<gv";
      options.desc = "Indent Left";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options.desc = "Indent Right";
    }

    # Copy to system clipboard
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>y";
      action = "\"+y";
      options.desc = "Copy to System Clipboard";
    }

    # Indent blank lines
    {
      mode = "n";
      key = "<leader>ui";
      action = "<cmd>IBLToggle<CR>";
      options.desc = "Toggle Indent Guides";
    }
    {
      mode = "n";
      key = "<leader>uI";
      action = "<cmd>IBLToggleScope<CR>";
      options.desc = "Toggle Indent Scope";
    }
  ];

  extraConfigLua = ''
    Snacks.toggle.line_number():map("<leader>ul")
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    Snacks.toggle.inlay_hints():map("<leader>uh")
  '';
}
