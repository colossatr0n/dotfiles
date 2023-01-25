" auto-install vim-plug
if empty(glob('~/dotfiles/config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/dotfiles/config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

call plug#begin('~/dotfiles/config/nvim/autoload/plugged')

	Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
    Plug 'doums/darcula'
    Plug 'itchyny/lightline.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'neovim/nvim-lspconfig'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
    Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
    Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
    Plug 'L3MON4D3/LuaSnip' " Snippets plugin
    Plug 'glepnir/lspsaga.nvim'
    Plug 'preservim/nerdtree'
    Plug 'akinsho/toggleterm.nvim'
    Plug 'jremmen/vim-ripgrep'
    Plug 'tpope/vim-commentary'
    Plug 'sbdchd/neoformat'

call plug#end()
