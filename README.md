# :rocket: Ubuntu Workspace

Parametrizações de ambiente de desenvolvimento no Ubuntu 20.04

<br>

![print](src/print.png)

<br>

## Dev Tools

Instalar GitHub CLI (Requer chave SSH)
```
sudo apt install git curl -y &&
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null &&
sudo apt update &&
sudo apt install gh &&
gh auth login
```

Baixar o repositório e executar o script de instalação:
```
gh repo clone lucasnemeses/ubuntu_workspace ~/Downloads/ubuntu_workspace &&
cd ~/Downloads/ubuntu_workspace &&
chmod 777 workspace.sh
./workspace.sh
```

Instalar Oh My ZSH:
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Executar o script de configuração do Oh My ZSH:
```
cd ~/Downloads/ubuntu_workspace &&
chmod 777 oh-my-zsh.sh &&
./oh-my-zsh.sh
```

Instalar tema Powerlevel10K:
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Instalar paleta de cores Dracula:
```
git clone https://github.com/dracula/gnome-terminal &&
gnome-terminal/./install.sh
```

## Gnome
### Extensões
- [Dash to Panel](https://extensions.gnome.org/extension/1160/dash-to-panel/)
- [Vitals](https://extensions.gnome.org/extension/1460/vitals/)

### Tema
Acesse o gnome-tweaks e altere o tema para Mojave:
```
gnome-tweaks
```
