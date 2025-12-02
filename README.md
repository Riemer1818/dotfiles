# Dotfiles

Personal configuration files for Linux system.

## Contents

- **bashrc** - Bash shell configuration
- **bash_aliases** - Custom aliases (volume, brightness, USB, audio switching)
- **gitconfig** - Git configuration
- **config/kitty/** - Kitty terminal emulator config
- **config/tmux/** - Tmux terminal multiplexer config
- **config/ranger/** - Ranger file manager config
- **config/flameshot/** - Flameshot screenshot tool config

## Installation

### Fresh Install

Clone and install on a new machine:

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
source ~/.bashrc
```

### Update Existing Configs

To pull latest changes from GitHub:

```bash
cd ~/dotfiles
git pull
./install.sh
source ~/.bashrc
```

### Backup Configs to GitHub

After making changes to your configs:

```bash
cd ~/dotfiles
./backup.sh  # Copies current configs from ~ to dotfiles/
git add .
git commit -m "Update configs"
git push
```

## Usage Notes

- The `install.sh` script creates symlinks from `~/dotfiles/` to your home directory
- Original files are backed up to `~/dotfiles_backup_TIMESTAMP/`
- Sensitive files (passwords, tokens) are excluded via `.gitignore`

## Customization

Edit files in `~/dotfiles/` and changes will immediately affect your system (since they're symlinked).
