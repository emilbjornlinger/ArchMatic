# Arch Linux Post Installation Setup and Config Scripts

### System Description
I run sway with lemurs as a login manager.

Swaylock is the lock manager.

To boot I use GRUB(2).

---

The install steps are as follows:

### Install Arch Linux

Follow the steps in ArchLinuxInstallationGuide.md then

---

### Setup ssh keys and git

- `$ ssh-keygen -t ed25519`
- Add key to ssh-agent: `$ eval "$(ssh-agent -s) && ssh-add ~/.ssh/id_ed25519"
- Add key to GitHub
- Setup git:
- `$ git config --global user.name "your-username"`
- `$ git config --global user.email "your-email@gmail.com"`

---

### Clone ArchMatic
Clone into the .config folder in order to be able to make changes to it.

- `$ cd ~/.config`
- `$ git clone git@github.com:emilbjornlinger/ArchMatic.git`
- `$ cd ArchMatic`

---

### Run ArchMatic files
Run the following scripts:

    $   ./1-sway.sh
    $   ./2-drivers.sh 
    $   ./4-bluetooth.sh 
    $   ./5-audio.sh 
    $   ./6-printers.sh 
    $   ./7-software-pacman.sh
    $   ./8-software-aur.sh
    $   ./9-setup.sh
    TODO Edit this list after editing files

**Note** The setup.sh file should contain all the setup that is done to the system so that it can be run several times in order to update the setup configuration. All other files should only install needed software.
**Note** The dotfiles-setup.sh can be run several times in order to apply the dotfiles from chezmoi, will do some type of setup TODO

### Reboot

    `$ reboot`

### Initialize Wayland/Window Manager:

## TODO

At the terminal, run:

    $   <???>

On subsequent logins use:

    $   <???>
