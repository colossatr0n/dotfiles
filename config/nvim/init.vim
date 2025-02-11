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
source $HOME/dotfiles/config/nvim/vimscript/nvim-markdown.vim

lua require('nvim-neodev')
lua require('nvim-cmp')
lua require('nvim-mason')
lua require('nvim-mason-lspconfig')
lua require('nvim-lspsaga')
lua require('nvim-lspconfig')

lua require('nvim-toggleterm')
lua require('nvim-ripgrep')
lua require('nvim-fzf')
lua require('nvim-telescope')

if $COLORTERM =~ 'truecolor' || $COLORTERM =~ '24bit'
    colorscheme nightfox
    " lua require('nvim-rose-pine')
endif

" Background colors for active vs inactive windows
hi InactiveWindow guibg=#0D1B22

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
  autocmd WinLeave * call Handle_Win_Enter()
  " autocmd WinNew * call Handle_Win_Enter()
augroup END

" Change highlight group of active/inactive windows
function! Handle_Win_Enter()
  setlocal winhighlight=NormalNC:InactiveWindow
endfunction
