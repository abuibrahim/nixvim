let
  inherit (import ./map.nix) keymap nmap;
in
{
  keymaps = [
    # Save
    (nmap "<C-s>" "<cmd>w<CR>" "Save File")

    # Quit/Session
    (nmap "<leader>qq" "<cmd>quitall<CR>" "Quit All")

    (keymap "v" "<" "<gv" "Indent Left")
    (keymap "v" ">" ">gv" "Indent Right")

    # Copy to system clipboard
    (keymap [ "n" "v" ] "<leader>y" "\"+y" "Copy to System Clipboard")

    # Indent blank lines
    (nmap "<leader>ui" "<cmd>IBLToggle<CR>" "Toggle Indent Guides")
    (nmap "<leader>uI" "<cmd>IBLToggleScope<CR>" "Toggle Indent Scope")
  ];

  extraConfigLua = ''
    Snacks.toggle.line_number():map("<leader>ul")
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    Snacks.toggle.inlay_hints():map("<leader>uh")
  '';
}
