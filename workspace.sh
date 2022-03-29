#!/bin/bash

echo "🔓️ Removendo eventuais travas do apt" &&
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;
echo "✅️ Eventuais travas do apt removidas" &&

echo "🔁️ Atualizando o repositório" &&
sudo apt update &&
echo "✅️ Repositório atualizado" &&

echo "📦️ Instalando pacotes e programas" &&
sudo apt install wget zsh unzip docker docker-compose filezilla chrome-gnome-shell gnome-tweak-tool dconf-editor build-essential -y &&
echo "✅️ Pacotes e programas Instalados" &&

echo "🌐️ Instalando Google Chrome" &&
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
sudo dpkg -i google-chrome-stable_current_amd64.deb &&
echo "✅️ Google Chrome instalado" &&

echo "📦️ Instalando pacotes Snap" &&
sudo snap install code --classic &&
sudo snap install beekeeper-studio &&
sudo snap install insomnia &&
echo "✅️ Pacotes Snap instalados" &&

echo "📂️ Criando diretórios" &&
mkdir ~/app &&
mkdir ~/.themes/ &&
mkdir -p ~/.fonts/MesloLG &&
echo "✅️ Diretórios criando" &&

echo "💬️ Instalando a fonte JetBrainsMono" &&
wget -P ~/.fonts/JetBrainsMono https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip &&
cd ~/.fonts/JetBrainsMono &&
unzip JetBrainsMono-2.242.zip &&
rm JetBrainsMono-2.242.zip &&
cd ~/Downloads/ubuntu_workspace &&
echo "✅️ Fonte JetBrainsMono instalado" &&

echo "✨️ Instalando tema Mojave no Gnome" &&
mv src/Mojave-dark-solid ~/.themes/Mojave-dark-solid &&
sudo add-apt-repository universe &&
echo "✅️ Tema Mojave no Gnome instalado" &&

echo "🖥️ Alterando bash para zsh" &&
chsh -s /bin/zsh &&
echo "✅️ bash alterado para zsh" &&

echo "😎️ Finalizado. O sistema será reiniciado em 5 segundos" &&
sleep 5 &&
sudo reboot
