source $HOME/dotfiles/config/vim/vimrc

" nvim booleans
set inccommand=split

" Load plugins
source $HOME/dotfiles/config/nvim/vim-plug/plugins.vim

" Load plugin configurations
source $HOME/dotfiles/config/nvim/vimscript/vim-sneak.vim
source $HOME/dotfiles/config/nvim/vimscript/nerdtree.vim
source $HOME/dotfiles/config/nvim/vimscript/vim-maximizer.vim
source $HOME/dotfiles/config/nvim/vimscript/gitgutter.vim
lua require('nvim-lspconfig')
lua require('nvim-lspsaga')
lua require('nvim-toggleterm')
lua require('nvim-ripgrep')
lua require('nvim-fzf')
