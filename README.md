# Setup an ubuntu machine

```bash
git clone https://github.com/chanwutk/setup-ubuntu.git
./setup-ubuntu/setup.sh
```

## Update System
```bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install git vim tmux
sudo apt-get autoremove -y
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
