<details>
<summary><b>🟡 DEV TOOLS</b></summary>
<br>

## Git
```
sudo apt install git
```

## Chrome
```
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb
```

## VS Code
```
sudo snap install code --classic
```

## PhpStorm
```
sudo snap install phpstorm --classic`
```

## Postma
```
sudo snap install postman
```

## Gitkraken*
```
sudo snap install gitkraken --classic
```

## FileZilla
```
sudo apt update
sudo apt install filezilla
```

---

</details>


<details>
<summary><b>🟣 COMPOSER</b></summary>
<br>

## Instalando o Composer

Ver tutorial da DigitalOcean

Após executar o comando abaixo:

```shell
sudo apt-get install libapache2-mod-php7.4 php7.4-common php7.4-mysql php7.4-curl php7.4-json php7.4-cgi php7.4-gd
```

---
</details>

<details>
<summary><b>🟢 XAMPP</b></summary>
<br>

## Instalando o Xampp

[ Download ](https://www.apachefriends.org/xampp-files/7.4.16/xampp-linux-x64-7.4.16-0-installer.run)

Alterar a permição do arquivo e executa-lo.
```
cd ~Download/
sudo chmod 777 xampp-linux-x64-7.4.16-0-installer.run
sudo ./xampp-linux-x64-7.4.16-0-installer.run
```

Durante a instalação desmarcar: *Learn more about Bitnami for XAMPP*

<br>

## Executando o Xampp

No terminal: 
```shell
sudo /opt/lampp/xampp start
sudo /opt/lampp/xampp restart
sudo /opt/lampp/xampp stop
```

> :warning:
> Caso aconteça o erro **netstat: comando não encontrado**.
> Executar o comando abaixo:
> ```
> sudo apt install net-tools
> ```

Diretório raiz do localhost:
`/opt/lampp/htdocs/`

Alterar usuário do diretório htcocs.
```
sudo chown -R $USER /opt/lampp/htdocs/
```

<br>

## Configurando xDebug

Como o Xampp rodadndo, acessar o [PHPInfo](http://localhost/dashboard/phpinfo.php), selecionar toda contéudo da página com `Ctrl + A` e copiar `Ctrl + C`.

Acessar o site do [xDebug](https://xdebug.org/wizard), colar o conteúdo do PHPInfo e clicar em `Analyse my phpinfo() output`.

Isso retornará uma lista de caracteristicas da versão do php instalado. Agora basta seguir as **instruções de instalação do xDebug**.

<br>

## Configurando Apache

Baixa o diretório `ini-config/` no [google drive](https://drive.google.com/drive/folders/1IQBRh5vwSu8xy4azhwMRj5bzPUe18R53), que possui duas vezes do `php.ini`, uma configurada segundo o curso **FullStack PHP Developer** e outro arquivo com a configuração padrão

Mover o diretório `ini-config/` para `/opt/lampp/etc/`
```
unizip ini-config.zip
sudo mv ini-config/ /opt/lampp/etc/ini-config/
```

Acessar o arquivo: `sudo gedit /opt/lampp/etc/httpd.conf` e fazer a seguinte alteração:
```conf
# descomentar - rescrita da url
LoadModule rewrite_module modules/mod_rewrite.so
```

<br>

## Instalando Certificado SSL

Ambiente local seguro - `https://`.

Baixar e extrair o certificado-ssl.zip no [google drive](https://drive.google.com/drive/u/0/folders/1iNYUVgjDXJP3POeBE9rgGQKUv2HStnWN).
```
cd ~/Downloads
unzip certificado-ssl.zip
cd certificado-ssl
```

Agora é preciso copiar os arquivos `localhost.crt` e `localhost.key`.
```
sudo cp localhost.crt /opt/lampp/etc/ssl.crt/
sudo cp localhost.key /opt/lampp/etc/ssl.crt/
```

Abrir o arquivo:
```
sudo gedit /opt/lampp/etc/extra/httpd-ssl.conf
```

Encontrar e alterar as linhas comentadas pelas de baixo.
```
# SSLCertificateFile "/opt/lampp/etc/ssl.crt/server.crt" 
SSLCertificateFile "/opt/lampp/etc/ssl.crt/localhost.crt"

# SSLCertificateKeyFile "/opt/lampp/etc/ssl.key/server.key"
SSLCertificateKeyFile "/opt/lampp/etc/ssl.crt/localhost.key"
```

### Adicionar o certificado nos browser

No Chrome:
Configurações **>** Gerenciar certificados **>** Autoridades **>** Importar.

Selecionar o arquivo `certificado-ssl/localhostCA.pem`
Marcar as configurações de confiança.

No Firefox:
Preferências **>** Privacidade e Segurança **>** Ver certificados **>** Autoridades **>** Importar.

Selecionar o arquivo `certificado-ssl/localhostCA.pem`
Marcar as configurações de confiança.

---
</details>


<details>
<summary><b>🟠 GNOME</b></summary>

## Extensões

Primeiro instale a extensão do **GnomeShell** para o Chrome.
```bash
sudo apt install chrome-gnome-shell
```

- [Dash to Panel](https://extensions.gnome.org/extension/1160/dash-to-panel/)
- [Vitals](https://extensions.gnome.org/extension/1460/vitals/)

<br>

## Tema

Baixar o tema **Mojave-dark-solid.tar.xz** no [Google Drive](https://drive.google.com/file/d/1FR_L1SYudQKeJIZkO7cGHM7iwJ_NPfC5/view)
```
sudo add-apt-repository universe
sudo apt install gnome-tweak-tool
mkdir ~/.themes/
tar -xvf ~/Downloads/Mojave-dark-solid.tar.xz
mv Mojave-dark-solid ~/.themes/Mojave-dark-solid
gnome-tweaks
```

---
</details>


<details>
<summary><b>🟡 OH MY ZSH</b></summary>
<br>

## Instalando Zsh:

```shell
sudo apt install zsh
zsh --version
```

Defir como shell padrão:
```shell
chsh -s $(which zsh)
```

Reiniciar a sessão, abrir o shell e selecionar a opção 2.

Fazer clone do repositório `Oh My Zsh` no diretório pessoal:
```shell
cd ~
git clone https://github.com/ohmyzsh/ohmyzsh.git
```

Alterar o nome do diretório `ohmyzsh`
```shell
mv ohmyzsh .oh-my-zsh
```

Copiar o `zshrc.zsh-template` para o diretório pessoal e renomear para `.zshrc`:
```shell
cp /home/$USER/.oh-my-zsh/templates/zshrc.zsh-template .zshrc
```

<br>

## Instalando font Meslo

[Baixe diretor do repositório do git](https://github.com/powerline/fonts/blob/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf)
```shell
mkdir ~/.fonts/
mv Downloads/Meslo\ LG\ M\ Regular\ for\ Powerline.ttf ~/.fonts/Meslo\ LG\ M\ Regular\ for\ Powerline.ttf
```
Adicionar o fonte ao terminal.

<br>

## Instalando Powerlevel9k

[Repositorio no github](https://github.com/Powerlevel9k/powerlevel9k#installation)

```shell
cd ~
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

No `~/.zshrc`, comentar a linha `ZSH_THEME="robbyrussell"` e adicionar embaixo:
```
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator user dir dir_writable vcs newline)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
```

<br>

## Instalando tema Dracula
```shell
cd ~
sudo apt install dconf-editor
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh
```

<br>

## Plugin ZSH

```shell
sudo apt install curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
```

Adicionar no arquivo `~/.zshrc` o conteudo abaixo apos `### End of ZInit's installer chunk`
```
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
```

<br>

## Atalhos

Adicionar no arquivo `~/.zshrc` o conteúdo abaixo após `# alias ohmyzsh="mate ~/.oh-my-zsh"`.
```shell
alias xt="sudo /opt/lampp/xampp start"
alias xp="sudo /opt/lampp/xampp stop"
alias xr="sudo /opt/lampp/xampp restart"
alias projetos="cd /opt/lampp/htdocs/projetos"
```

**Reinicia a sessão para finalizar a configuração**

---
</details>