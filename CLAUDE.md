# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository that manages system configurations for NixOS systems using GNU Stow. The repository contains configurations for two hosts: `crazy-diamond` (Lenovo ThinkPad P16v) and `echoes` (Dell Vostro 5410), with shared configurations in the `global` directory.

## Commands

### NixOS Configuration Management

```bash
# Apply configuration for a specific host
sudo stow -d ~/dotfiles --dotfiles --target / crazy-diamond
sudo stow -d ~/dotfiles --dotfiles --target / echoes

# Remove configuration (unstow)
sudo stow -D -d ~/dotfiles --dotfiles --target / <hostname>

# Update channels and rebuild system
sudo nix-channel --update && sudo nixos-rebuild switch --upgrade && sudo nix-collect-garbage -d

# Test configuration without switching
sudo nixos-rebuild test

# Build configuration without switching
sudo nixos-rebuild build
```

### Package Management

```bash
# Search for packages
nix search nixpkgs <package-name>

# Install packages temporarily
nix-shell -p <package-name>

# Clean up old generations
sudo nix-collect-garbage -d
```

### Formatting

```bash
# Format Nix files (nixfmt is configured in Zed settings)
nixfmt <file.nix>
```

## Architecture

### Directory Structure

- `crazy-diamond/` - Host-specific configuration for ThinkPad P16v
- `echoes/` - Host-specific configuration for Dell Vostro 5410  
- `global/` - Shared configurations across all hosts

### NixOS Configuration Organization

Each host follows this structure:
- `etc/nixos/configuration.nix` - Main system configuration
- `etc/nixos/packages/` - Modular package definitions
  - `default.nix` - Package module imports
  - `common.nix` - Base system packages and services
  - `dev.nix` - Development tools
  - `editors.nix` - Text editors and IDEs
  - `fonts.nix` - Font packages
  - `gnome.nix` - GNOME desktop environment packages
  - `tools.nix` - Additional utility packages

### Key Configuration Files

- `global/home/bagfen/dot-config/zed/settings.json` - Zed editor configuration with Nix language support
- `global/home/bagfen/dot-gitconfig` - Git configuration
- `global/home/bagfen/dot-tmux.conf` - tmux configuration
- `global/etc/nixos/packages/editors.nix` - Neovim configuration with plugins and LSP support

### System Services

Common services configured:
- GNOME desktop environment with GDM
- PipeWire audio system
- NetworkManager for networking
- CUPS printing
- Fcitx5 input method for Chinese

### Important Notes

- All configurations use `stateVersion = "25.05"`
- Unfree packages are allowed via `nixpkgs.config.allowUnfree = true`
- Time zone is set to `Asia/Taipei`
- Locale is mixed: `en_US.UTF-8` for default, `zh_TW.UTF-8` for regional settings
- User account: `bagfen` with groups `networkmanager`, `wheel`, `dialout`

### Editor Configurations

#### Neovim
- Configured via NixOS module with comprehensive plugin ecosystem
- LSP support with nvim-lspconfig and nvim-cmp for completion
- Telescope for fuzzy finding and navigation
- Treesitter for syntax highlighting
- Git integration with gitsigns and fugitive
- Catppuccin theme matching system theme
- Comprehensive key bindings with space as leader key
- Set as default editor with vi/vim aliases

#### Zed Editor
- Uses Claude Sonnet 4 model for AI assistance
- Vim mode enabled with relative line numbers
- Nixd language server configured for Nix files
- Catppuccin Macchiato theme
- Hack Nerd Font Mono for buffer font