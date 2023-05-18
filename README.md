# Setup an ubuntu machine

```bash
git clone https://github.com/chanwutk/setup-ubuntu.git
./setup-ubuntu/setup.sh
```

## Update System
```bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git vim tmux hstr
sudo apt-get autoremove -y
```

## Environment Variables to .profile or .bash_profile
```bash
# XDG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Cleanup Home Directory

# nv
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
# docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
# gnupg
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
# ipython
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
# jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
# less
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
# node
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
# keras
export KERAS_HOME="${XDG_STATE_HOME}/keras"
# java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
# bash_history
export HISTFILE="${XDG_CACHE_HOME}/bash/history"
# npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
# gem
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
# parallel
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
# python
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
# Autoenv
export AUTOENV_AUTH_FILE="$XDG_STATE_HOME"/autoenv/authorized_list
export AUTOENV_NOTAUTH_FILE="$XDG_STATE_HOME"/autoenv/not_authorized_list
export AUTOENV_ENABLE_LEAVE=1

alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"

export TERM="xterm-256color"

# local libaries
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/.local/lib
export PATH=$HOME/.local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

export LIB_PATH=$HOME/.local
export CFLAGS=-I${LIB_PATH}/include
export LDFLAGS=-L${LIB_PATH}/lib

export LANG="en_US.UTF-8"
```

## Add to .bashrc
```bash
# Aliases
alias vim="nvim"

# Git Status
source $XDG_DATA_HOME/gitstatus/gitstatus.prompt.sh

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
export HSTR_TIOCSTI=y

export HSTR_CONFIG=$HSTR_CONFIG,hide-basic-help

# fnm
eval "`fnm env`"

# Conda Init

# Autoenv
source $XDG_DATA_HOME/autoenv/activate.sh
```

## Git Status
```bash
git clone git@github.com:chanwutk/gitstatus.git $XDG_DATA_HOME/gitstatus
```

## Autoenv
```bash
git clone git@github.com:hyperupcall/autoenv.git $XDG_DATA_HOME/autoenv
```

## Install Tmux Config
```bash
git clone git@github.com:chanwutk/tmux.git $XDG_CONFIG_HOME/tmux

# if tmux < 2.8
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
```

## Install Node LTS
```bash
curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "$HOME/.local/bin"
source ~/.bashrc
fnm install --lts
```

## Install Mamba
```bash
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
bash Mambaforge-$(uname)-$(uname -m).sh -p $XDG_DATA_HOME/mambaforge
```

# Install NeoVim
```bash
sudo apt-get install -y ninja-build gettext cmake unzip curl
cd
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable

# Either
make CMAKE_BUILD_TYPE=Release
sudo make install
# Or
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local"
make install
```

# Install LunarVim
```bash
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```
