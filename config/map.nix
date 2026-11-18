# Keymap helpers: `keymap mode key action desc` makes a silent mapping, and
# `lua` turns Lua code into an action.
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
}
