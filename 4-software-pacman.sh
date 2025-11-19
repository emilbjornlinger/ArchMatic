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
    'fastfetch'             # Shows system info when you launch terminal
    'speedtest-cli'         # Internet speed via terminal
    'unrar'                 # RAR compression program
    'unzip'                 # Zip compression program
    'wget'                  # Remote content retrieval
    'zip'                   # Zip compression program
    'zsh'                   # ZSH shell
    'ghostty'               # Terminal
    'starship'              # Starship shell
    'ripgrep'               # Fuzzy file search
    'less'                  # Needed for git diff
    'man'                   # View man pages
    'chezmoi'               # Manage dotfiles
    'xdg-user-dirs'         # Get common directories
    'swayimg'               # Image viewer
    'wpa_supplicant'        # Key negotiation
    'wl-clipboard'          # Clipboard
    
    # DEVELOPMENT ---------------------------------------------------------

    'clang'                 # C Lang compiler
    'cmake'                 # Cross-platform open-source make system
    'neovim'                # Editor
    'jre21-openjdk'         # Running java apps

    # MEDIA ---------------------------------------------------------------

    'vlc'                   # Video player
    'flameshot'   	        # Screenshot capture.
    'grim'   	            # Screen capture adapter
    'ffmpeg'   	    	    # Screen capture.

    # PRODUCTIVITY --------------------------------------------------------

    'zathura'               # PDF viewer
    'zathura-pdf-mupdf'     # Zathura plugin
    'obsidian'              # Admin system
    'obsidian-icon-theme'   # Obsidian icons
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
