#!/bin/bash

## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

## Atualizando o repositório ##
sudo apt update &&

## Instalando pacotes e programas do repositório deb do Ubuntu ##
sudo apt install wget zsh unzip docker docker-compose filezilla chrome-gnome-shell gnome-tweak-tool dconf-editor build-essential -y &&

## Instalando Google Chrome ###
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
sudo dpkg -i google-chrome-stable_current_amd64.deb &&

## Instalando pacotes Snap ##
sudo snap install code --classic &&
sudo snap install beekeeper-studio &&
sudo snap install insomnia &&

## Executando o comando Docker sem sudo ##
sudo usermod -aG docker ${USER} &&

## Criando diretórios ##
mkdir ~/app &&
mkdir ~/.themes/ &&
mkdir ~/.fonts/MesloLG &&

## Instalando a fonte JetBrainsMono ##
wget -P ~/.fonts/JetBrainsMono https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip &&
unzip ~/.fonts/JetBrainsMono/JetBrainsMono-2.242.zip &&

## Instalando tema Mojave no Gnome ##
mv src/Mojave-dark-solid ~/.themes/Mojave-dark-solid &&
sudo add-apt-repository universe &&

## Alterando bash para zsh ##
chsh -s /bin/zsh &&

echo "✅️ Finalizado" &&
sudo reboot