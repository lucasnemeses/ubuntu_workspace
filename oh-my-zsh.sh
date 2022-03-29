#!/bin/bash

echo "💬️ Instalando Oh My ZSH" &&
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&
echo "✅️ Oh My ZSH instalado" &&

echo "💬️ Instalando Powerlevel10K" &&
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k &&
echo "✅️ Powerlevel10K instalado" &&

echo "💬️ Alterando tema zsh para Powelevel10K" &&
sed -i 's+ZSH_THEME="robbyrussell"+ZSH_THEME="powerlevel10k/powerlevel10k"\nPOWERLEVEL10K_LEFT_PROMPT_ELEMENTS=(user dir dir_writable vcs newline)\nPOWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=(status)+g' ~/.zshrc &&
echo "✅️ Tema zsh alterado para Powelevel10K" &&

echo "💬️ Baixando plugins ZSH" &&
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions &&
echo "✅️ Plugins ZSH baixados" &&

echo "💬️ Adicionando plugins" &&
sed -i 's+plugins=(git)+plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)+g' ~/.zshrc &&
echo "✅️ Plugins adicionado" &&

echo "💬️ Configurando Docker" &&
sudo usermod -aG docker ${USER} &&
sed -i 's+export ZSH="$HOME/.oh-my-zsh"+export ZSH="$HOME/.oh-my-zsh"\nexport WWWUSER=${WWWUSER:-$UID}\nexport WWWGROUP=${WWWGROUP:-$(id -g)}+g' ~/.zshrc 
echo "✅️ Docker configurado" &&

echo "💬️ Adicionando Alias" &&
sed -i 's+# alias ohmyzsh="mate ~/.oh-my-zsh"+alias app="cd ~/app/"\nalias docker-up="docker-compose up -d"\nalias docker-down="docker-compose down"\nalias docker-bash="docker-compose exec app bash"\nalias docker-remove="docker rm -f $(docker ps --format '{{.ID}}')"+g' ~/.zshrc &&
echo "✅️ Alias adicionados" &&

echo "💬️ Instalando fonte Meslo" &&
git clone https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf ~/.fonts/MesloLG/MesloLGS%20NF%20Regular.ttf &&
git clone https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf ~/.fonts/MesloLG/MesloLGS%20NF%20Bold.ttf &&
git clone https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf ~/.fonts/MesloLG/MesloLGS%20NF%20Italic.ttf &&
git clone https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf ~/.fonts/MesloLG/MesloLGS%20NF%20Bold%20Italic.ttf &&
echo "✅️ Fonte Meslo instalada" &&

echo "💬️ Instalando tema Dracula ao terminal" &&
git clone https://github.com/dracula/gnome-terminal &&
gnome-terminal/./install.sh &&
echo "✅️ Tema Dracula instalado no terminal" &&

echo "💬️ Atualizando o sistema" &&
sudo apt update &&
sudo apt dist-upgrade -y &&
sudo apt autoclean -y &&
sudo apt autoremove -y &&
echo "✅️ Sistema atualizado" &&

echo "😎️ Finalizado" &&
sudo reboot
