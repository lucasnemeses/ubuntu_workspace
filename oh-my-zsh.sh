#!/bin/bash
echo "📥️ Baixando plugins ZSH" &&
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions &&
echo "✅️ Plugins ZSH baixados" &&

echo "🎆️ Adicionando plugins" &&
sed -i 's+plugins=(git)+plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)+g' ~/.zshrc &&
echo "✅️ Plugins adicionado" &&

echo "🐳️ Configurando Docker" &&
sudo usermod -aG docker ${USER} &&
sed -i 's+export ZSH="$HOME/.oh-my-zsh"+export ZSH="$HOME/.oh-my-zsh"\nexport WWWUSER=${WWWUSER:-$UID}\nexport WWWGROUP=${WWWGROUP:-$(id -g)}+g' ~/.zshrc 
echo "✅️ Docker configurado" &&

echo "📑️ Adicionando Alias" &&
sed -i 's+# alias ohmyzsh="mate ~/.oh-my-zsh"+alias app="cd ~/app/"\nalias docker-up="docker-compose up -d"\nalias docker-down="docker-compose down"\nalias docker-bash="docker-compose exec app bash"\nalias docker-remove="docker rm -f $(docker ps --format '{{.ID}}')"+g' ~/.zshrc &&
echo "✅️ Alias adicionados" &&

echo "💬️ Instalando fonte Meslo" &&
wget -P ~/.fonts/MesloLG/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf &&
wget -P ~/.fonts/MesloLG/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf &&
wget -P ~/.fonts/MesloLG/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf &&
wget -P ~/.fonts/MesloLG/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf &&
echo "✅️ Fonte Meslo instalada" &&

echo "🔁️ Atualizando o sistema" &&
sudo apt update &&
sudo apt dist-upgrade -y &&
sudo apt autoclean -y &&
sudo apt autoremove -y &&
echo "✅️ Sistema atualizado" &&

echo "😎️ Finalizado. O sistema será reiniciado em 5 segundos" &&
sleep 5 &&
sudo reboot
