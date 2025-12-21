{
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./catppuccin.nix
    ./conform.nix
    ./indent-blankline.nix
    ./gitsigns.nix
    ./lsp.nix
    ./lualine.nix
    ./neo-tree.nix
    ./notify.nix
    ./ui.nix
    ./telescope.nix
    ./treesitter.nix
    ./which-key.nix
    ./keymaps.nix
  ];

  globals = {
    mapleader = " ";

    # Disable useless providers
    loaded_ruby_provider = 0; # Ruby
    loaded_perl_provider = 0; # Perl
    loaded_python_provider = 0; # Python 2
  };

  opts = {
    # Performance & Timing
    updatetime = 100; # CursorHold delay; faster completion and git signs
    lazyredraw = false; # Breaks noice plugin
    synmaxcol = 240; # Disable syntax highlighting for long lines
    timeoutlen = 500; # Key sequence timeout (ms)
    smoothscroll = true; # Smooth scrolling with Ctrl-D/U

    # Project-local config
    exrc = true; # Enable .nvim.lua, .nvimrc, .exrc in project directories

    # UI & Appearance
    number = true;
    relativenumber = true;
    cursorline = true;
    cursorcolumn = false;
    signcolumn = "yes";
    colorcolumn = "80";
    laststatus = 3; # Global statusline
    showtabline = 2;
    showmode = false;
    showmatch = true;
    matchtime = 1; # Flash duration in deciseconds
    termguicolors = true;
    winborder = "rounded";

    # Windows & Splits
    splitbelow = true;
    splitright = true;

    # Mouse
    mouse = "a";
    mousemodel = "extend"; # Right-click extends selection

    # Search
    incsearch = true;
    ignorecase = true; # Case-insensitive search
    smartcase = true; # Unless pattern contains uppercase

    # Files & Buffers
    swapfile = false;
    undofile = true;
    autoread = true;
    writebackup = false;
    fileencoding = "utf-8";
    modeline = true; # Scan for editor directives like 'vim: set ft=nix:'
    modelines = 100; # Scan first/last 100 lines for modelines

    # Indentation & Formatting
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    autoindent = true;
    breakindent = true;
    copyindent = true;
    preserveindent = true;
    linebreak = true;
    wrap = false;

    # Folding
    foldlevel = 99; # Keep folds open by default
    foldcolumn = "1";
    foldenable = true;
    foldlevelstart = -1; # -1 uses foldlevel value
    # foldtext = ""; # Empty uses builtin foldtext
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
    virtualedit = "block";
    startofline = true;
    title = true;
  };
}
