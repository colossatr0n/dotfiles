source $HOME/dotfiles/config/vim/vimrc
source $HOME/dotfiles/config/nvim/vim-plug/plugins.vim
lua require('nvim-lspconfig')
lua require('nvim-lspsaga')
lua require('nvim-toggleterm')
lua require('nvim-ripgrep')

set number
set updatetime=100
let mapleader=","
set hidden

" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>m :NERDTreeFind<CR>

" Go to last used window
nnoremap <space>a <c-w><c-p>


colorscheme darcula
let g:lightline = { 'colorscheme': 'darculaOriginal' }

" GitGutter + Darcula
hi! link GitGutterAdd GitAddStripe
hi! link GitGutterChange GitChangeStripe
hi! link GitGutterDelete GitDeleteStripe
let g:gitgutter_sign_removed = '▶'
