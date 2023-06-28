# Neovim
## Linux
Ensure available nvim version is > 0.8.0
```
apt list neovim
```
If it is, install it. If not, go to neovim github page and install it.
Or follow the instructions here:

```
cd ~/Downloads
wget https://github.com/neovim/neovim/releases/download/v0.8.1/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
```

If you accidentally installed a lower nvim version, you may need to run and then try again.

```
sudo apt purge neovim
sudo apt purge neovim-runtime
```

## MacOS
```
brew install neovim
```

# Zsh
## Linux

```
cd ~
sudo apt install zsh
touch .zshrc.local

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Run powerlevel10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

# Node/NPM
## MacOS
```
brew install node
```

# FZF
## MacOS
```
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
```

## Linux
```
sudo apt install fzf
```

# RipGrep
## MacOS
```
brew install ripgrep
```

## Linux
```
sudo apt-get install ripgrep
```

# Symlinks
```
ln -s ~/dotfiles/config/zsh ~/.config/
ln -s ~/dotfiles/config/zsh/zshrc ~/.zshrc
ln -s ~/dotfiles/config/nvim ~/.config/
ln -s ~/dotfiles/config/vim ~/.config/
ln -s ~/dotfiles/config/p10k ~/.config/
ln -s ~/dotfiles/config/surfingkeys ~/.config/
```

# NVim Setup
After installing neovim and running the symlinks section above, open nvim, you'll probably see a bunch of errors, ignore them and run `:PlugInstall`
