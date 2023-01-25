source $HOME/dotfiles/config/vim/vimrc
source $HOME/dotfiles/config/nvim/vim-plug/plugins.vim

set number
set updatetime=100
let mapleader=","

colorscheme darcula
let g:lightline = { 'colorscheme': 'darculaOriginal' }

" GitGutter + Darcula
hi! link GitGutterAdd GitAddStripe
hi! link GitGutterChange GitChangeStripe
hi! link GitGutterDelete GitDeleteStripe
let g:gitgutter_sign_removed = '▶'

