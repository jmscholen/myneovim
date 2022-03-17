# Introduction

A neovim configuration for Rails developers.  Also works with Javascript, python and soildity.  Ready to use and well
documented.

# Demo

![demo](demo.gif)

# Dependencies
- Neovim 0.5+
- lazygit
- ripgrep
- NerdFonts
- Python

# Installation

1. Install a nerd font and configure your terminal to use it.  Nerd fonts [Here](https://www.nerdfonts.com/font-downloads)
2. Install the config

```sh
git clone git@github.com:otavioschwanck/nvim-on-rails.git ~/.config/nvim
```

3. Run this: `git config --global push.default current`
4. Install packer:
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
5. Install some dependencies:

```sh
python -m pip install neovim-remote pynvim
python -m pip3 install neovim-remote pynvim
npm install -g neovim diagnostic-languageserver
gem install solargraph neovim
```

6. (a) Ubuntu Steps

```sh
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update

sudo apt-get install sqlite3 libsqlite3-dev neovim xclip

export VER="0.31.4"
wget -O lazygit.tgz https://github.com/jesseduffield/lazygit/releases/download/v${VER}/lazygit_${VER}_Linux_x86_64.tar.gz
tar xvf lazygit.tgz
sudo mv lazygit /usr/local/bin/
```

6. (b) Mac Steps

```sh
brew install jesseduffield/lazygit/lazygit
brew install lazygit sqlite
brew install --HEAD neovim
```

7. Add to your .zshrc ou .bashrc:

```sh
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    alias nvim=nvr -cc split --remote-wait +'set bufhidden=wipe'
fi

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
    export VISUAL="nvim"
    export EDITOR="nvim"
fi
```

8. For Linux only:

7. Run `nvim` on the terminal and then, run `:PackerSync` and `:InstallConfigs`.

# After install

- Check the `user.vim` for let `g:python_host_prog` part.  Probabily you will need to uncomment.
- Check if is missing something with `:checkhealth`

# For mac Users

To use Alt commands, like M-d (multiple-cursors), use Option + key.

# Updating

Run ':UpdateNvimONRails'.

# How to learn the keybindings of this configuration?

Just press `SPC h h` to open the handbook inside vim.


# Troubleshoot

## Error on python for some reason.

Check your personal config `SPC f p` at the bottom.  Set the python envs to their real values.

# Other tips

## Tmux

I Really recommend you to learn tmux / tmuxinator.  Take a look on tmuxinator on youtube.
