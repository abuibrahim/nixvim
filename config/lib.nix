# Helpers: `keymap mode key action desc` makes a silent mapping,
# `lua` turns Lua code into an action, and `picker` is Lua code that opens a
# picker: Rex's in neorex, else the snacks one.
rec {
  keymap = mode: key: action: desc: {
    inherit mode key action;
    options = {
      silent = true;
      inherit desc;
    };
  };
  nmap = keymap "n";
  lua = code: { __raw = code; };
  picker =
    source: "function() (vim.g.neorex and require('neorex.pick') or Snacks.picker).${source}() end";
}
