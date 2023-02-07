# Linux
## Neovim
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

## Zsh
```
# Install zsh
cd ~
sudo apt install zsh
touch .zshrc.local
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Run powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

# Symlinks
```
ln -s ~/dotfiles/config/zsh ~/.config/
ln -s ~/dotfiles/config/nvim ~/.config/
ln -s ~/dotfiles/config/vim ~/.config/
ln -s ~/dotfiles/config/p10k ~/.config/
ln -s ~/dotfiles/config/surfingkeys ~/.config/
```
