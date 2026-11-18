let
  inherit (import ./map.nix) nmap;
in
{
  plugins.trouble.enable = true;

  keymaps = [
    (nmap "<leader>xx" "<cmd>Trouble diagnostics toggle<CR>" "Diagnostics (Trouble)")
    (nmap "<leader>xX" "<cmd>Trouble diagnostics toggle filter.buf=0<CR>"
      "Buffer Diagnostics (Trouble)"
    )
    (nmap "<leader>xs" "<cmd>Trouble symbols toggle<CR>" "Symbols (Trouble)")
    (nmap "<leader>xl" "<cmd>Trouble lsp toggle win.position=right<CR>"
      "LSP References/Definitions (Trouble)"
    )
    (nmap "<leader>xL" "<cmd>Trouble loclist toggle<CR>" "Location List (Trouble)")
    (nmap "<leader>xq" "<cmd>Trouble qflist toggle<CR>" "Quickfix List (Trouble)")
  ];
}
