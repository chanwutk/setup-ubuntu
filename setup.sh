#!/bin/bash
set -e

# update system
sudo apt update
yes | sudo apt upgrade


# install node lts
curl -fsSL https://fnm.vercel.app/install | bash
fnm install --lst


# install python
sudo apt-get update; sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
curl https://pyenv.run | bash
pyenv install 3.7.12
pyenv global 3.7.12


# install NeoVim
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim


# install LunarVim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
lvim +"LspInstall pyright" +qall now
lvim +"TSInstall python" +qall now


# install tmux
sudo apt install -y tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
echo "" >> .bashrc
echo "alias tmux=\"TERM=xterm-256color tmux\"" >> .bashrc


