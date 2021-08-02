# :rocket: Ubuntu Workspace

Parametrizações de ambiente de desenvolvimento PHP no Ubuntu 20.04

![print](src/print.png)

<br>

## :purple_circle: DEV TOOLS

**apt**

```
sudo apt update
sudo apt install -y git curl mysql-server apache2 zsh unzip filezilla chrome-gnome-shell gnome-tweak-tool dconf-editor tableplus
```

**dpkg**

```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
wget -O - -q http://deb.tableplus.com/apt.tableplus.com.gpg.key | sudo apt-key add - 
sudo add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian tableplus main"
```

**snap**

```
sudo snap install code --classic
```

<br>

## :large_blue_circle: DOCKER

Seguir o tutorial do DigitalOcean para instalação do Docker e Docker Composer.
- [Docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04-pt)
- [Docker Compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04-pt)

<br>

## :green_circle: OH MY ZSH

### Instalando Zsh:

Defir Zsh como shell padrão:

```shell
chsh -s $(which zsh)
```

Reiniciar a sessão, abrir o terminal e selecionar a opção 2.

Fazer clone do repositório `Oh My Zsh` no diretório pessoal, copiar o arquivo `zshrc.zsh-template` para o diretório pessoal e renomear-o para `.zshrc`:

```shell
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```

### Instalando fonte Meslo

Clonar esse repositório e mover a fonte para o diretório `~/.fonts/`.

```shell
git clone https://github.com/lucasnemeses/ubuntu_workspace ~/Downloads/ubuntu_workspace
mkdir ~/.fonts/
mv ~/Downloads/ubuntu_workspace/src/Meslo\ LG\ M\ Regular\ for\ Powerline.ttf ~/.fonts/Meslo\ LG\ M\ Regular\ for\ Powerline.ttf
```

Adicionar o fonte ao terminal.

### Instalando Powerlevel9k

```shell
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

Abrir o arquivo `~/.zshrc`:

```
nano ~/.zshrc
```

Comentar a linha `ZSH_THEME="robbyrussell"` e adicionar embaixo:

```
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator user dir dir_writable vcs newline)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
```

### Instalando tema Dracula

```shell
git clone https://github.com/dracula/gnome-terminal ~/gnome-terminal
~/gnome-terminal/./install.sh
```

### Plugin ZSH

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
```

Abrir o arquivo `~/.zshrc`:

```shell
nano ~/.zshrc
```

Adicionar o conteudo abaixo após `### End of ZInit's installer chunk`

```
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
```

### Atalhos

Adicionar no arquivo `~/.zshrc` o conteúdo abaixo após `# alias ohmyzsh="mate ~/.oh-my-zsh"`.

```shell
nano ~/.zshrc
```

```
alias app="cd ~/app/"
alias amt="sudo service apache2 start && service mysql start"
alias amr="sudo service apache2 restart && service mysql restart"
alias ams="sudo service apache2 stop && service mysql stop"
alias sail='bash vendor/bin/sail'
alias dockersail='docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v $(pwd):/opt \
    -w /opt \
    laravelsail/php80-composer:latest \
    composer install --ignore-platform-reqs'
```

<br>

## :yellow_circle: ASDF

CLI gerenciador de versões de multiplas linguagens.
Para instalar o asdf no ohmyzsh basta adicionar o `plugins=(asdf)` abaixo de `plugins=(git)` e clonar o repositório do asdf.

```
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
```

Plugin de versões do php e nodejs:

```
asdf plugin-add php https://github.com/asdf-community/asdf-php.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
```

Lista as versões de php e nodejs disponiveis:

```
asdf list-all php
asdf list-all nodejs
```

Instalação de uma versão do php (já com composer) e nodejs:

```
asdf install php 7.4.22
asdf install nodejs 16.5.0
```

Extensões do php:

```
sudo apt install -y openssl php-common php-curl php-json php-mbstring php-mysql php-xml php-zip libapache2-mod-php php-mysql php-cgi php-gd
```

Acesso global:

```
asdf global php 7.4.22
asdf global nodejs 16.5.0
```

Lista os plugins instalados:

```
asdf plugin-list
```

<br>

## :orange_circle: APP FOLDER

O diretório de projetos será `~/app`. Dentro dele será criado um link simbólico para `/var/www/html`, diretório raiz do localhost apache, para projeto que não estejam parametrizados com docker.

```
mkdir ~/app
ln -s /var/www/html  ~/app/apache
```

<br>

## :red_circle: GNOME

### Extensões

- [Dash to Panel](https://extensions.gnome.org/extension/1160/dash-to-panel/)
- [Vitals](https://extensions.gnome.org/extension/1460/vitals/)

### Tema

Mover o diretório do tema para `~/.themes` e ao final realizar a troca do tema via gnome-tweaks.

```shell
sudo add-apt-repository universe
mkdir ~/.themes/
mv ~/Downloads/ubuntu_workspace/src/Mojave-dark-solid ~/.themes/Mojave-dark-solid
gnome-tweaks
```

<br>

## :brown_circle: VS CODE

### Extensões

- [Dracula Official](https://marketplace.visualstudio.com/items?itemName=dracula-theme.theme-dracula)
- [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)
- [Laravel Extra Intellisense](https://marketplace.visualstudio.com/items?itemName=amiralizadeh9480.laravel-extra-intellisense)
- [Laravel Blade Snippets](https://marketplace.visualstudio.com/items?itemName=onecentlin.laravel-blade)
- [Laravel-goto-controller](https://marketplace.visualstudio.com/items?itemName=stef-k.laravel-goto-controller)
- [Laravel goto view](https://marketplace.visualstudio.com/items?itemName=codingyu.laravel-goto-view)
- [laravel-blade](https://marketplace.visualstudio.com/items?itemName=cjhowe7.laravel-blade)
- [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense)
- [DotENV](https://marketplace.visualstudio.com/items?itemName=mikestead.dotenv)
- [IntelliSense for CSS class names in HTML](https://marketplace.visualstudio.com/items?itemName=Zignd.html-css-class-completion)
- [Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)
- [Auto Close Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-close-tag)
- [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
- [Markdown Emoji](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-emoji)

### Fonte

Move o diretório da fonte JetBrains Mono para `~/.fonts`

```
mv ~/Downloads/ubuntu_workspace/src/JetBrainsMono-1.0.3 ~/.fonts/JetBrainsMono-1.0.3
```

No VS Code acessar o arquivo `settings.json` [Ctrl + ,] e adicionar o contedo abaixo.

```
"editor.fontFamily": "JetBrains Mono",
"editor.fontSize": 14,
"editor.fontLigatures": true
```
