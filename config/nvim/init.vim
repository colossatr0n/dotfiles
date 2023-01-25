source $HOME/dotfiles/config/vim/vimrc

set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a

set rtp+=/usr/local/opt/fzf

set number
set updatetime=100
let mapleader=" "
set hidden
set inccommand=split
set timeoutlen=500
set ignorecase
set smartcase

" Go to last used window
nnoremap <leader>w <c-w><c-p>

" Load plugins
source $HOME/dotfiles/config/nvim/vim-plug/plugins.vim
source $HOME/dotfiles/config/nvim/vimscript/vim-sneak.vim
source $HOME/dotfiles/config/nvim/vimscript/nerdtree.vim
source $HOME/dotfiles/config/nvim/vimscript/vim-maximizer.vim
lua require('nvim-lspconfig')
lua require('nvim-lspsaga')
lua require('nvim-toggleterm')
lua require('nvim-ripgrep')
lua require('nvim-fzf')

" Configure plugins (these should be in there own files
" GitGutter + Darcula
colorscheme darcula
let g:lightline = { 'colorscheme': 'darculaOriginal' }

hi! link GitGutterAdd GitAddStripe
hi! link GitGutterChange GitChangeStripe
hi! link GitGutterDelete GitDeleteStripe
let g:gitgutter_sign_removed = '▶'

function! OpenURLUnderCursor()
  let s:uri = expand('<cWORD>')
  let s:uri = substitute(s:uri, '?', '\\?', '')
  let s:uri = shellescape(s:uri, 1)
  if s:uri != ''
    silent exec "!open '".s:uri."'"
    :redraw!
  endif
endfunction
nnoremap gx :call OpenURLUnderCursor()<CR>
