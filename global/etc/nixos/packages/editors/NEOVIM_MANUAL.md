# Neovim Configuration Manual

This manual documents the Neovim configuration defined in `global/etc/nixos/packages/editors/neovim.nix`.

## Overview

Your Neovim setup is configured through NixOS with a comprehensive plugin ecosystem focused on modern development workflows. The configuration includes LSP support, fuzzy finding, Git integration, and enhanced editing capabilities.

## Key Features

- **Leader Key**: Space (` `) is set as the leader key
- **Default Editor**: Set as system default with `vi` and `vim` aliases
- **Plugin Management**: Managed through NixOS with automatic loading
- **Theme**: Catppuccin color scheme
- **LSP Support**: Language Server Protocol for intelligent code completion
- **Git Integration**: Built-in Git commands and visual indicators

## Basic Settings

### Display & UI
- Line numbers enabled (`set number`)
- Syntax highlighting enabled
- Current line highlighting (`set cursorline`)
- Show command in status line (`set showcmd`)
- Show matching brackets (`set showmatch`)
- Show ruler (`set ruler`)

### Indentation
- Tab width: 4 spaces
- Automatic indentation enabled
- Smart indentation enabled
- Tabs expanded to spaces

### Search
- Incremental search (`set incsearch`)
- Case-insensitive search (`set ignorecase`)
- Smart case matching (`set smartcase`)
- Search highlighting enabled

### Clipboard & Splits
- System clipboard integration (`clipboard=unnamedplus`)
- New splits open below and to the right

## Key Mappings

### Leader Key Commands
| Key Combination | Action | Description |
|----------------|--------|-------------|
| `<Space>h` | `:nohlsearch<CR>` | Clear search highlighting |
| `<Space>e` | `:NvimTreeToggle<CR>` | Toggle file explorer |
| `<Space>f` | `:Telescope find_files<CR>` | Find files |
| `<Space>g` | `:Telescope live_grep<CR>` | Search text in files |
| `<Space>b` | `:Telescope buffers<CR>` | List open buffers |

### Window Navigation
| Key Combination | Action | Description |
|----------------|--------|-------------|
| `Ctrl+h` | `<C-w>h` | Move to left window |
| `Ctrl+j` | `<C-w>j` | Move to window below |
| `Ctrl+k` | `<C-w>k` | Move to window above |
| `Ctrl+l` | `<C-w>l` | Move to right window |

### Text Editing
| Key Combination | Mode | Action | Description |
|----------------|------|--------|-------------|
| `Alt+j` | Normal | `:m .+1<CR>==` | Move current line down |
| `Alt+k` | Normal | `:m .-2<CR>==` | Move current line up |
| `Alt+j` | Visual | `:m '>+1<CR>gv=gv` | Move selected lines down |
| `Alt+k` | Visual | `:m '<-2<CR>gv=gv` | Move selected lines up |

### Visual Mode Indentation
| Key Combination | Action | Description |
|----------------|--------|-------------|
| `<` | `<gv` | Decrease indentation and keep selection |
| `>` | `>gv` | Increase indentation and keep selection |

## Installed Plugins

### Essential Plugins
- **vim-sensible**: Sensible defaults for Vim
- **vim-sleuth**: Automatic indentation detection

### Navigation & Search
- **telescope.nvim**: Fuzzy finder for files, buffers, and more
- **telescope-fzf-native.nvim**: Native FZF sorter for Telescope
- **nvim-web-devicons**: File type icons

### File Management
- **nvim-tree.lua**: File explorer sidebar

### Git Integration
- **gitsigns.nvim**: Git signs in the gutter
- **vim-fugitive**: Git commands within Vim

### Language Support
- **nvim-treesitter**: Advanced syntax highlighting
- **nvim-lspconfig**: LSP client configurations
- **vim-nix**: Nix language support

### Code Completion
- **nvim-cmp**: Completion engine
- **cmp-nvim-lsp**: LSP source for nvim-cmp
- **cmp-buffer**: Buffer source for nvim-cmp
- **cmp-path**: Path source for nvim-cmp
- **cmp-cmdline**: Command line source for nvim-cmp
- **luasnip**: Snippet engine
- **cmp_luasnip**: Snippet source for nvim-cmp

### UI Enhancement
- **lualine.nvim**: Status line
- **catppuccin-nvim**: Color scheme
- **indent-blankline.nvim**: Indentation guides

### Utilities
- **comment.nvim**: Easy commenting
- **nvim-autopairs**: Automatic bracket pairing
- **which-key.nvim**: Key binding help

## Beginner Tutorial

### Getting Started

1. **Opening Neovim**
   ```bash
   nvim filename.txt
   # or simply
   vi filename.txt
   # or
   vim filename.txt
   ```

2. **Basic Modes**
   - **Normal Mode**: Default mode for navigation and commands
   - **Insert Mode**: Press `i` to enter, `Esc` to exit
   - **Visual Mode**: Press `v` for character selection, `V` for line selection
   - **Command Mode**: Press `:` to enter commands

### Essential Commands

#### File Operations
- `:w` - Save file
- `:q` - Quit
- `:wq` - Save and quit
- `:q!` - Quit without saving

#### Navigation
- `h`, `j`, `k`, `l` - Move left, down, up, right
- `w` - Move to next word
- `b` - Move to previous word
- `0` - Move to beginning of line
- `$` - Move to end of line
- `gg` - Go to first line
- `G` - Go to last line

#### Editing
- `i` - Insert before cursor
- `a` - Insert after cursor
- `o` - Insert new line below
- `O` - Insert new line above
- `x` - Delete character under cursor
- `dd` - Delete current line
- `yy` - Copy current line
- `p` - Paste after cursor
- `u` - Undo
- `Ctrl+r` - Redo

### Using Your Custom Key Mappings

1. **Clear Search Highlighting**
   - After searching, press `Space` then `h` to clear highlights

2. **Window Navigation**
   - Use `Ctrl+h/j/k/l` to move between split windows

3. **Moving Lines**
   - In Normal mode: `Alt+j/k` to move current line down/up
   - In Visual mode: Select lines, then `Alt+j/k` to move selection

4. **Better Indentation**
   - Select text in Visual mode
   - Press `<` or `>` to indent/unindent
   - Selection remains active for repeated indentation

### Plugin-Specific Usage

#### Telescope (Fuzzy Finder)
- `<Space>f` or `:Telescope find_files` - Find files
- `<Space>g` or `:Telescope live_grep` - Search text in files
- `<Space>b` or `:Telescope buffers` - List open buffers

#### File Explorer (nvim-tree)
- `<Space>e` or `:NvimTreeToggle` - Toggle file explorer
- `:NvimTreeFocus` - Focus file explorer

#### Git (Fugitive)
- `:Git status` - Git status
- `:Git add %` - Add current file
- `:Git commit` - Git commit

### Tips for Beginners

1. **Start with Basics**: Master Normal mode navigation before exploring plugins
2. **Use Visual Mode**: Select text first, then apply operations
3. **Practice Key Combinations**: The custom mappings will become muscle memory
4. **Explore Gradually**: Don't try to learn all plugins at once
5. **Use Help**: `:help <topic>` for built-in documentation

### Common Workflows

#### Editing a File
1. Open file: `nvim filename`
2. Navigate to desired location
3. Enter Insert mode: `i`
4. Make changes
5. Exit Insert mode: `Esc`
6. Save: `:w`

#### Working with Multiple Files
1. Split window: `:split filename` or `:vsplit filename`
2. Navigate between windows: `Ctrl+h/j/k/l`
3. Close window: `:q`

#### Git Workflow
1. Check status: `:Git status`
2. Add changes: `:Git add %`
3. Commit: `:Git commit`
4. View diff: `:Git diff`

This configuration provides a powerful development environment. Start with basic commands and gradually incorporate the advanced features as you become more comfortable.