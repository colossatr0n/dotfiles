" auto-install vim-plug
if empty(glob('~/dotfiles/config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/dotfiles/config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/dotfiles/config/nvim/autoload/plugged')

	Plug '/usr/local/opt/fzf'
	Plug 'junegunn/fzf.vim'
    Plug 'doums/darcula'
    Plug 'itchyny/lightline.vim'
    Plug 'airblade/vim-gitgutter'

call plug#end()
