{
  # Import all your configuration modules here
  imports = [
    ./blink-cmp.nix
    ./blink-pairs.nix
    ./bufferline.nix
    ./catppuccin.nix
    ./conform.nix
    ./indent-blankline.nix
    ./gitsigns.nix
    ./lsp.nix
    ./lualine.nix
    ./mini-surround.nix
    ./notify.nix
    ./persistence.nix
    ./ui.nix
    ./telescope.nix
    ./trouble.nix
    ./treesitter.nix
    ./treesitter-textobjects.nix
    ./which-key.nix
    ./keymaps.nix
  ];

  diagnostic.settings = {
    severity_sort = true;
    virtual_lines.current_line = true;
  };

  globals.mapleader = " ";

  withRuby = false;
  withPython3 = false;

  opts = {
    # Performance & Timing
    updatetime = 100; # CursorHold delay; faster completion and git signs
    synmaxcol = 240; # Disable syntax highlighting for long lines
    timeoutlen = 500; # Key sequence timeout (ms)
    smoothscroll = true; # Scroll wrapped lines by screen line

    # Project-local config
    exrc = true; # Enable .nvim.lua, .nvimrc, .exrc in project directories

    # UI & Appearance
    number = true;
    relativenumber = true;
    cursorline = true;
    signcolumn = "yes";
    laststatus = 3; # Global statusline
    showtabline = 2;
    showmode = false;
    showmatch = true;
    matchtime = 1; # Flash duration in deciseconds
    winborder = "rounded";

    # Windows & Splits
    splitbelow = true;
    splitright = true;
    scrolloff = 4;
    sidescrolloff = 8;

    # Mouse
    mouse = "a";
    mousemodel = "extend"; # Right-click extends selection

    # Search
    inccommand = "split";
    ignorecase = true; # Case-insensitive search
    smartcase = true; # Unless pattern contains uppercase

    # Files & Buffers
    swapfile = false;
    undofile = true;
    autoread = true;
    writebackup = false;
    fileencoding = "utf-8";
    modelines = 100; # Scan first/last 100 lines for modelines

    # Indentation & Formatting
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    breakindent = true;
    copyindent = true;
    preserveindent = true;
    linebreak = true;
    wrap = false;

    # Folding
    foldlevel = 99; # Keep folds open by default
    foldcolumn = "1";
    foldtext = ""; # Empty uses builtin foldtext
    fillchars = {
      horiz = "━";
      horizup = "┻";
      horizdown = "┳";
      vert = "┃";
      vertleft = "┫";
      vertright = "┣";
      verthoriz = "╋";

      eob = " ";
      diff = "╱";

      fold = " ";
      foldopen = "";
      foldclose = "";
      foldinner = " ";

      msgsep = "‾";
    };

    # Completion & Pop-up
    pumheight = 10; # Max pop-up menu items
    infercase = true;
    completeopt = [
      "menuone"
      "noselect"
      "popup"
    ]; # Native completion options

    # Command Line & Messages
    cmdheight = 0; # Hide command line when not in use
    history = 100; # Command history limit
    report = 9001; # Disable "x more/fewer lines" messages

    # Editor Behavior
    confirm = true;
    virtualedit = "block";
    startofline = true;
    title = true;
  };
}
