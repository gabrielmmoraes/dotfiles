#!/bin/bash

echo "Instalando dependências..."
yay -S git firefox google-chrome discord pulseaudio pavucontrol \
    flashfocus python3 visual-studio-code-bin flameshot spotify \
    gitkraken steam ttf-font-awesome-4 powerline termite polybar /
    ttf-iosevka zsh rofi

echo "Copiando config do i3wm"
rm  ~/.i3/config
ln -s ~/git/dotfiles/i3/config ~/.i3/config

echo "Copiando config do compton"
rm  ~/.config/compton.conf
ln -s ~/git/dotfiles/compton/compton.conf ~/.config/compton.conf

echo "Copiando diretório do dunst"
rm -rf ~/.config/dunst
ln -s ~/git/dotfiles/dunst/ ~/.config/dunst

echo "Copiando diretório do Polybar"
rm -rf ~/.config/polybar
ln -s ~/git/dotfiles/polybar/ ~/.config/polybar

echo "Copiando diretório do FlashFocus"
rm -rf ~/.config/flashfocus
ln -s ~/git/dotfiles/flashfocus/ ~/.config/

echo "Copiando diretório do Termite"
rm -rf ~/.config/termite
ln -s ~/git/dotfiles/termite/ ~/.config/termite

echo "Copiando pasta de papéis de parede"
rm -rf ~/Pictures/wallpapers
ln -s ~/git/dotfiles/wallpapers/ ~/Pictures/wallpapers

echo "Clonando repositório de plugins do polybar"
mkdir ~/.config/polybar/custom-plugins

git clone https://github.com/polybar/polybar-scripts.git
rm -rf ~/.config/polybar/custom-plugins/polybar-scripts
mv ./polybar-scripts ~/.config/polybar/custom-plugins
chmod +x ~/.config/polybar/polybar-scripts/polybar-scripts/info-hackspeed/info-hackspeed.sh

git clone https://github.com/Jvanrhijn/polybar-spotify.git
rm -rf ~/.config/polybar/custom-plugins/polybar-spotify
mv ./polybar-spotify ~/.config/polybar/custom-plugins

echo "Mudando browser para firefox"
rm ~/.profile
ln ~/git/dotfiles/.profiles ~/.profile

echo "Mudando shell para zsh"
chsh -s /bin/zsh

echo "Finalizado"
