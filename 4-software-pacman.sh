#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo
echo "INSTALLING SOFTWARE"
echo

PKGS=(

    # TERMINAL UTILITIES --------------------------------------------------

    'curl'                  # Remote content retrieval
    'htop'                  # System monitoring via terminal
    'neofetch'              # Shows system info when you launch terminal
    'speedtest-cli'         # Internet speed via terminal
    'unrar'                 # RAR compression program
    'unzip'                 # Zip compression program
    'wget'                  # Remote content retrieval
    'zip'                   # Zip compression program
    'zsh'                   # ZSH shell
    'ghostty'               # Terminal
    'starship'              # Starship shell
    'ripgrep'               # Fuzzy file search
    'feh'                   # Image viewer
    'less'                  # Needed for git diff

    # DEVELOPMENT ---------------------------------------------------------

    'clang'                 # C Lang compiler
    'cmake'                 # Cross-platform open-source make system
    'neovim'                # Editor

    # MEDIA ---------------------------------------------------------------

    'vlc'                   # Video player
    'flameshot'   	    # Screenshot capture.
    'ffmpeg'   	    	    # Screen capture.

    # PRODUCTIVITY --------------------------------------------------------

    'zathura'               # PDF viewer
    'obsidian'              # Admin system
    'python-gpgme'          # Dependency for dropbox

    # APPLICATION LAUNCHER ------------------------------------------------

    'wofi'                  # Application launcer for wayland
)

sudo pacman -Syu
for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo
