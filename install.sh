#!/bin/bash
# Dotfiles installation script
# This script creates symlinks from home directory to dotfiles repo

set -e

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "Installing dotfiles from $DOTFILES_DIR"

# Create backup directory
mkdir -p "$BACKUP_DIR"
echo "Backup directory created at $BACKUP_DIR"

# Function to backup and link
link_file() {
    local source="$1"
    local target="$2"

    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Backing up existing $target"
        mv "$target" "$BACKUP_DIR/"
    fi

    echo "Creating symlink: $target -> $source"
    ln -sf "$source" "$target"
}

# Link bash files
link_file "$DOTFILES_DIR/bashrc" "$HOME/.bashrc"
link_file "$DOTFILES_DIR/bash_aliases" "$HOME/.bash_aliases"

# Link git config
link_file "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"

# Link .config directories
mkdir -p "$HOME/.config"

if [ -d "$DOTFILES_DIR/config/kitty" ]; then
    link_file "$DOTFILES_DIR/config/kitty" "$HOME/.config/kitty"
fi

if [ -d "$DOTFILES_DIR/config/tmux" ]; then
    link_file "$DOTFILES_DIR/config/tmux" "$HOME/.config/tmux"
fi

if [ -d "$DOTFILES_DIR/config/ranger" ]; then
    link_file "$DOTFILES_DIR/config/ranger" "$HOME/.config/ranger"
fi

if [ -d "$DOTFILES_DIR/config/flameshot" ]; then
    link_file "$DOTFILES_DIR/config/flameshot" "$HOME/.config/flameshot"
fi

echo ""
echo "✓ Dotfiles installation complete!"
echo "✓ Backups saved to: $BACKUP_DIR"
echo ""
echo "Reload your shell with: source ~/.bashrc"
