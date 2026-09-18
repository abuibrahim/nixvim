{ lib, ... }:
let
  mkSelect = key: query: desc: {
    mode = [
      "x"
      "o"
    ];
    inherit key;
    action.__raw = "function() require('nvim-treesitter-textobjects.select').select_textobject('${query}') end";
    options = {
      silent = true;
      inherit desc;
    };
  };

  mkMove = key: fn: query: desc: {
    mode = [
      "n"
      "x"
      "o"
    ];
    inherit key;
    action.__raw = "function() require('nvim-treesitter-textobjects.move').${fn}('${query}') end";
    options = {
      silent = true;
      inherit desc;
    };
  };

  mkSwap = key: fn: query: desc: {
    mode = "n";
    inherit key;
    action.__raw = "function() require('nvim-treesitter-textobjects.swap').${fn}('${query}') end";
    options = {
      silent = true;
      inherit desc;
    };
  };
in
{
  plugins.treesitter-textobjects.enable = true;

  extraConfigLua = ''
    require("nvim-treesitter-textobjects").setup({
      select = { lookahead = true },
      move = { set_jumps = true },
    })
  '';

  keymaps =
    lib.mapAttrsToList (key: spec: mkSelect key spec.query spec.desc) {
      "af" = {
        query = "@function.outer";
        desc = "Function (outer)";
      };
      "if" = {
        query = "@function.inner";
        desc = "Function (inner)";
      };
      "ac" = {
        query = "@class.outer";
        desc = "Class (outer)";
      };
      "ic" = {
        query = "@class.inner";
        desc = "Class (inner)";
      };
      "aa" = {
        query = "@parameter.outer";
        desc = "Parameter (outer)";
      };
      "ia" = {
        query = "@parameter.inner";
        desc = "Parameter (inner)";
      };
      "ai" = {
        query = "@conditional.outer";
        desc = "Conditional (outer)";
      };
      "ii" = {
        query = "@conditional.inner";
        desc = "Conditional (inner)";
      };
      "al" = {
        query = "@loop.outer";
        desc = "Loop (outer)";
      };
      "il" = {
        query = "@loop.inner";
        desc = "Loop (inner)";
      };
    }
    ++ [
      (mkMove "]f" "goto_next_start" "@function.outer" "Next Function Start")
      (mkMove "[f" "goto_previous_start" "@function.outer" "Previous Function Start")
      (mkMove "]F" "goto_next_end" "@function.outer" "Next Function End")
      (mkMove "[F" "goto_previous_end" "@function.outer" "Previous Function End")
      (mkMove "]t" "goto_next_start" "@class.outer" "Next Class Start")
      (mkMove "[t" "goto_previous_start" "@class.outer" "Previous Class Start")
      (mkSwap "<leader>cp" "swap_next" "@parameter.inner" "Swap Next Parameter")
      (mkSwap "<leader>cP" "swap_previous" "@parameter.inner" "Swap Previous Parameter")
    ];
}
