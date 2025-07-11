{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    configure = {
      customRC = ''
        syntax enable

        set number
        set hlsearch
        set tabstop=4
        set shiftwidth=4
        set expandtab

        filetype on
        filetype plugin on
        filetype indent on

        " Better search
        set incsearch
        set ignorecase
        set smartcase

        " Better indentation
        set smartindent
        set autoindent

        " Better UI
        set showcmd
        set showmatch
        set ruler
        set cursorline

        " Better navigation
        set scrolloff=8
        set sidescrolloff=8

        " Better clipboard
        set clipboard=unnamedplus

        " Better splits
        set splitbelow
        set splitright

        " Key mappings
        let mapleader = " "

        " Clear search highlight
        nnoremap <leader>h :nohlsearch<CR>

        " Better window navigation
        nnoremap <C-h> <C-w>h
        nnoremap <C-j> <C-w>j
        nnoremap <C-k> <C-w>k
        nnoremap <C-l> <C-w>l

        " Better indentation in visual mode
        vnoremap < <gv
        vnoremap > >gv

        " Move lines up/down
        nnoremap <A-j> :m .+1<CR>==
        nnoremap <A-k> :m .-2<CR>==
        vnoremap <A-j> :m '>+1<CR>gv=gv
        vnoremap <A-k> :m '<-2<CR>gv=gv
      '';

      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          # Essential plugins
          vim-sensible
          vim-sleuth

          # Navigation and search
          telescope-nvim
          telescope-fzf-native-nvim
          nvim-web-devicons

          # File explorer
          nvim-tree-lua

          # Git integration
          gitsigns-nvim
          vim-fugitive

          # Syntax highlighting and language support
          nvim-treesitter.withAllGrammars

          # LSP and completion
          nvim-lspconfig
          nvim-cmp
          cmp-nvim-lsp
          cmp-buffer
          cmp-path
          cmp-cmdline
          luasnip
          cmp_luasnip

          # Status line
          lualine-nvim

          # Color scheme
          catppuccin-nvim

          # Nix support
          vim-nix

          # Additional utilities
          comment-nvim
          nvim-autopairs
          indent-blankline-nvim
          which-key-nvim
        ];
      };
    };
  };
}