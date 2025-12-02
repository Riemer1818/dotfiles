#!/bin/bash
# Backup script - copies current configs to dotfiles repo

set -e

DOTFILES_DIR="$HOME/dotfiles"

echo "Backing up configs to $DOTFILES_DIR"

# Copy bash files
cp ~/.bashrc "$DOTFILES_DIR/bashrc"
cp ~/.bash_aliases "$DOTFILES_DIR/bash_aliases"
echo "✓ Bash configs backed up"

# Copy git config
cp ~/.gitconfig "$DOTFILES_DIR/gitconfig"
echo "✓ Git config backed up"

# Copy .config directories
if [ -f ~/.config/kitty/kitty.conf ]; then
    cp ~/.config/kitty/kitty.conf "$DOTFILES_DIR/config/kitty/"
    echo "✓ Kitty config backed up"
fi

if [ -f ~/.config/tmux/tmux.conf ]; then
    cp ~/.config/tmux/tmux.conf "$DOTFILES_DIR/config/tmux/"
    echo "✓ Tmux config backed up"
fi

if [ -d ~/.config/ranger ]; then
    cp ~/.config/ranger/*.conf "$DOTFILES_DIR/config/ranger/" 2>/dev/null || true
    echo "✓ Ranger configs backed up"
fi

if [ -d ~/.config/flameshot ]; then
    cp -r ~/.config/flameshot/* "$DOTFILES_DIR/config/flameshot/" 2>/dev/null || true
    echo "✓ Flameshot config backed up"
fi

echo ""
echo "✓ Backup complete!"
echo ""
echo "Next steps:"
echo "  cd ~/dotfiles"
echo "  git add ."
echo "  git commit -m 'Update configs'"
echo "  git push"
