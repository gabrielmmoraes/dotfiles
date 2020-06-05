#!/bin/bash

echo "Instalando dependências..."
yay -S git firefox google-chrome discord pulseaudio pavucontrol \
    flashfocus python3 visual-studio-code-bin flameshot spotify \
    gitkraken steam ttf-font-awesome-4 powerline termite polybar \
    ttf-iosevka zsh rofi picom npm go feh yarn

echo "Copiando config do i3wm"
rm  ~/.i3/config
ln -s ~/git/dotfiles/i3/config ~/.i3/config

echo "Copiando config do picom"
rm  ~/.config/picom.conf
ln -s ~/git/dotfiles/picom/picom.conf ~/.config/picom.conf

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
mv ./polybar-scripts/polybar-scripts ~/.config/polybar/custom-plugins/polybar-scripts
chmod +x ~/.config/polybar/custom-plugins/polybar-scripts/info-hackspeed/info-hackspeed.sh
rm -rf ./polybar-scripts

git clone https://github.com/Jvanrhijn/polybar-spotify.git
rm -rf ~/.config/polybar/custom-plugins/polybar-spotify
mv ./polybar-spotify ~/.config/polybar/custom-plugins/

echo "Mudando browser para firefox"
rm ~/.profile
ln ~/git/dotfiles/.profiles ~/.profile

echo "Instalando pywal"
pip3 install pywal

if [ "$SHELL" != "/bin/zsh"  ]; then
	echo "Mudando shell para zsh"
	chsh -s /bin/zsh
fi

echo "Copiando .vimrc"
rm ~/.vimrc
ln ~/git/dotfiles/.vimrc ~/.vimrc

echo "Instalando oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Copiando .zshrc"
rm ~/.zshrc
ln -s ~/git/dotfiles/.zshrc ~/.zshrc

echo "Instalando YouCompleteMe (vim)"
cd ~/.vim/bundle
git clone https://github.com/ycm-core/YouCompleteMe.git
cd YouCompleteMe
python3 install.py --all

echo "Finalizado"
