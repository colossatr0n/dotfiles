source $HOME/dotfiles/config/vim/vimrc

" nvim booleans
set inccommand=split
set termguicolors

" Load plugins
source $HOME/dotfiles/config/nvim/vim-plug/plugins.vim

" Load plugin configurations
source $HOME/dotfiles/config/nvim/vimscript/vim-sneak.vim
source $HOME/dotfiles/config/nvim/vimscript/nerdtree.vim
source $HOME/dotfiles/config/nvim/vimscript/vim-maximizer.vim
source $HOME/dotfiles/config/nvim/vimscript/gitgutter.vim
" source $HOME/dotfiles/config/nvim/vimscript/darcula.vim
" lua require('mason')
" lua require('mason-lspconfig')
lua require('nvim-lspconfig')
" lua require('lsp-zero')
lua require('nvim-lspsaga')
lua require('nvim-toggleterm')
lua require('nvim-ripgrep')
lua require('nvim-fzf')
lua require('nvim-rose-pine')
