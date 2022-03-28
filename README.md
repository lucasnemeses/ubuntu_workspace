# :rocket: Ubuntu Workspace

Parametrizações de ambiente de desenvolvimento no Ubuntu 20.04

<br>

![print](src/print.png)

<br>

## Dev Tools

Instalar GitHub CLI:
```
sudo apt install git curl -y &&
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null &&
sudo apt update &&
sudo apt install gh 
```

Baixar o repositório e executar o script de instalação:
```
gh repo clone lucasnemeses/ubuntu_workspace ~/Downloads/ubuntu_workspace &&
cd ~/Downloads/ubuntu_workspace &&
.workspace.sh
```

O reiniar, executar o script de instalação do Oh My ZSH:
```
cd ~/Downloads/ubuntu_workspace &&
.oh-my-zsh.sh
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

### Configurar fonte no VS Code

No VS Code acessar o arquivo `settings.json` [Ctrl + ,] e adicionar o contedo abaixo:
```
"editor.fontFamily": "JetBrains Mono",
"editor.fontSize": 14,
"editor.fontLigatures": true
```
