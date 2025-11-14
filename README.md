# Dotfiles Configuration

This repository contains my personal dotfiles configuration for various tools and applications, managed using GNU Stow for easy symlink management.

## Overview

This is a collection of configuration files (dotfiles) for setting up my development environment. It includes configurations for Neovim, Oh My Zsh, and other tools I use in my daily workflow. The repository uses Git submodules for plugin management and Stow for easy deployment.

## Prerequisites

- GNU Stow
- Git
- Neovim
- Zsh with Oh My Zsh

## Installation

### 1. Clone the repository
```bash
git clone https://github.com/X-ChenD-Hai/.dotfiles.git
cd dotfiles
```

### 2. Initialize and update submodules
```bash
git submodule update --init --recursive
```

### 3. Install configurations using Stow

**Option A: Install all configurations**
```bash
stow -v -t ~ .
```

**Option B: Install specific configurations**
```bash
Install only Neovim configuration
stow -v -t ~ nvim
```
Install only Zsh configuration
```bash
stow -v -t ~ oh-zsh
```

### 4. Install Neovim plugins
After stowing the nvim configuration, open Neovim to install plugins:

## Directory Structure

```
.dotfiles/
├── nvim/
│   └── .config/nvim/
│       ├── lua/
│       │   ├── config/
│       │   │   └── lsp/
│       │   └── plugins/
│       ├── .luarc.json
│       ├── init.lua
│       └── lazy-lock.json
└── oh-zsh/
    └── .config/
        ├── omz-custom/
        │   ├── plugins/
        │   ├── themes/
        │   └── example.zsh
        └── zsh/
            ├── alias.zsh
            ├── brew.zsh
            └── plugin.zsh
    └── .zshrc

```
## Components

### Neovim Configuration

The Neovim configuration is organized in a modular structure using Lua:

- `init.lua`: Main entry point for Neovim configuration
- `lua/config/`: Core configuration modules
  - `core.lua`: Basic editor settings
  - `key_map.lua`: Key mappings
  - `lazy.lua`: Plugin manager setup (Lazy.nvim)
  - `lsp/`: Language Server Protocol configurations
- `lua/plugins/`: Individual plugin configurations
  - Various plugins like bufferline, telescope, treesitter, mason, etc.

### Oh My Zsh Configuration

Zsh configuration includes:

- `.zshrc`: Main Zsh configuration file
- Custom aliases in `alias.zsh`
- Plugin configurations in `plugin.zsh`
- Custom plugins and themes in `omz-custom/`

## Stow Management

### Adding new configurations
1. Create a new directory for your tool (e.g., `git/`)
2. Place configuration files in the appropriate structure
3. Stow the new configuration:
```bash
   stow -v -t ~ git
```

### Removing configurations
```bash
stow -v -D -t ~ nvim  # Remove nvim configuration
```

### Restowing after changes
```bash
stow -v -R -t ~ nvim  # Restow nvim configuration
```

## Git Submodules

This repository uses Git submodules for:
- Neovim plugins (managed by Lazy.nvim)
- Oh My Zsh custom plugins and themes

### Updating submodules
bash
git submodule update --remote  # Update all submodules to latest commits


### Adding new submodules
```bash
git submodule add https://github.com/user/repo.git path/to/submodule
```

## Troubleshooting

### Stow conflicts
If you encounter conflicts with existing files:
```bash
Backup existing files first
mv ~/.zshrc ~/.zshrc.backup
stow -v -t ~ oh-zsh
```

### Submodule issues
If submodules aren't initializing properly:
```bash
git submodule deinit -f .
git submodule update --init --recursive
```

## Notes

- Some files may have been excluded based on .gitignore rules
- Binary files are not included in this repository
- Security checks have been disabled in the packed version
- Always backup your existing configurations before stowing

## MIT License
