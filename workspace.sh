#!/bin/bash

## Removendo travas eventuais do apt ##
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

## Atualizando o repositório ##
sudo apt update &&

## Instalando pacotes e programas do repositório deb do Ubuntu ##
sudo apt install git curl wget zsh unzip docker docker-compose filezilla chrome-gnome-shell gnome-tweak-tool dconf-editor vlc build-essential -y &&

## Instalando pacotes Snap ##
sudo snap install code --classic &&
sudo snap install chromium &&
sudo snap install beekeeper-studio &&
sudo snap install insomnia &&
sudo snap install libreoffice &&
sudo snap install vlc &&

## Executando o comando Docker sem sudo ##
sudo usermod -aG docker ${USER} &&

## Criando diretório ##
mkdir ~/app &&
mkdir ~/.themes/ &&
mkdir ~/.fonts/MesloLG &&

## Instalar fonte JetBrainsMono ##
wget -P ~/.fonts/JetBrainsMono https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip &&
unzip ~/.fonts/JetBrainsMono/JetBrainsMono-2.242.zip &&

## Instalando tema Mojave no Gnome ##
mv /src/Mojave-dark-solid ~/.themes/Mojave-dark-solid &&
sudo add-apt-repository universe &&

## Instalação do Oh My ZSH ##
chsh -s /bin/zsh && zsh &&
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&

## Instalação do Powerlevel10k ##
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k &&

## Alterar tema zsh para Powelevel10K ##
sed -i 's+ZSH_THEME="robbyrussell"+ZSH_THEME="powerlevel10k/powerlevel10k"\nPOWERLEVEL10K_LEFT_PROMPT_ELEMENTS=(user dir dir_writable vcs newline)\nPOWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=(status)+g' ~/.zshrc &&

## Baixando plugins ZSH ##
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions &&

## Adicionando plugins ##
sed -i 's+plugins=(git)+plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)+g' ~/.zshrc &&

## Configurando Docker
sed -i 's+export ZSH=$HOME/.oh-my-zsh+export ZSH=$HOME/.oh-my-zsh\nexport WWWUSER=${WWWUSER:-$UID}\nexport WWWGROUP=${WWWGROUP:-$(id -g)}+g' ~/.zshrc &&

## Adicionando Alias ##
sed -i 's+# alias ohmyzsh="mate ~/.oh-my-zsh"+alias app="cd ~/app/"\nalias docker-up="docker-compose up -d"\nalias docker-down="docker-compose down"\nalias docker-bash="docker-compose exec app bash"\nalias docker-remove="docker rm -f $(docker ps --format '{{.ID}}')"+g' ~/.zshrc &&

## Instalando fonte Meslo ##
git clone https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf ~/.fonts/MesloLG/MesloLGS%20NF%20Regular.ttf &&
git clone https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf ~/.fonts/MesloLG/MesloLGS%20NF%20Bold.ttf &&
git clone https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf ~/.fonts/MesloLG/MesloLGS%20NF%20Italic.ttf &&
git clone https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf ~/.fonts/MesloLG/MesloLGS%20NF%20Bold%20Italic.ttf &&

## Instalando tema Dracula ao terminal ##
git clone https://github.com/dracula/gnome-terminal &&
gnome-terminal/./install.sh &&

## Atualização do sistema ##
sudo apt update &&
sudo apt dist-upgrade -y &&
sudo apt autoclean -y &&
sudo apt autoremove -y &&

echo "✅️ Finalizado" &&
sudo shutdown -r 1 "O sistema será reiniciado"