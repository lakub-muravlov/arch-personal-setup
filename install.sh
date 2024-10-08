#!/bin/bash
sudo pacman -Syu

cp .zshrc ~/.zshrc

echo "Installing necessary packages"

if command -v git &>/dev/null; then
  echo "Git v$(git -v | awk '{print $3}') is already installed in your system"
else
  sudo pacman -S git base-devel -y
fi

if command -v yay &>/dev/null; then
    echo "Yay $(yay -V | awk '{print $2}') is installed in your system"
else
    echo "Yay is present in the system."
    echo "Installing Yay..."
    git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd ..
fi

echo "Installing necessary packages..."

yay -S dbeaver gitkraken jmeter storageexplorer postman-bin --noconfirm

echo "Cleaning up the system to escape vscode/storageexplorer debug packages conflicts"

yay -Sc --noconfirm

sudo pacman -Rs $(pacman -Qtdq) --noconfirm

echo "Installing necessary packages..."

yay -S visual-studio-code-bin zed wine wine-mono wine-gecko bottles steam blender gimp gwenview inkscape kcolorchooser krita okular spectacle timeshift element-desktop brave-bin filezilla librewolf-bin signal-desktop telegram-desktop thunderbird torbrowser-launcher transmission-qt vesktop-bin discord qbittorrent epiphany audacity handbrake kdenlive obs-studio vlc spotify logseq-desktop-bin onlyoffice-bin bleachbit btop gparted partitionmanager nvtop bitwarden neovim vim kweather ttf-droid ttf-ms-fonts ttf-jetbrains-mono noto-fonts ttf-croscore ttf-roboto noto-fonts-cjk noto-fonts-emoji noto-fonts-extra korganizer kdepim-addons fzf zoxide qt5-quickcontrols2 qt5-graphicaleffects qt5-xmlpatterns fastfetch yt-dlp gdu nvidia-open networkmanager-openvpn cava zen-browser-bin android-tools ffmpeg zsh --noconfirm

echo "Creating bin directory in home"

mkdir -p ~/.local/bin

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

curl -fsSL https://bun.sh/install | bash

git config --global core.editor "nvim"
git config --global credential.helper "cache --timeout=86400"

echo "Changing shell to zsh"

sudo chsh -s /usr/bin/zsh

echo "Remove unnecessary packages"
yay -Sc --noconfirm 
sudo pacman -Rs $(pacman -Qtdq) --noconfirm