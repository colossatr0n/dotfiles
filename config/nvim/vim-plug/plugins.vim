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

    " LSP support
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'

    " Autocompletion
    Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
    Plug 'hrsh7th/cmp-buffer'  " provides suggestions based on the current file.
    Plug 'hrsh7th/cmp-path' " gives completions based on the filesystem.
    Plug 'hrsh7th/cmp-nvim-lua' " provides completions based on neovim's lua api.
    Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp. show data send by the language server.
    Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp. it shows snippets in the suggestions.

    " Snippets
    Plug 'L3MON4D3/LuaSnip' " Snippets plugin
    Plug 'rafamadriz/friendly-snippets'

      " LSP Setup
    Plug 'VonHeikemen/lsp-zero.nvim'
    Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

    " FZF
	Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
    if executable('make')
        Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    elseif executable('cmake')
        Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    endif

    Plug 'itchyny/lightline.vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    
    " GIT
    Plug 'airblade/vim-gitgutter'

    Plug 'preservim/nerdtree'
    Plug 'akinsho/toggleterm.nvim'
    Plug 'jremmen/vim-ripgrep'
    Plug 'tpope/vim-commentary'
    Plug 'sbdchd/neoformat'
    Plug 'machakann/vim-highlightedyank'
    Plug 'justinmk/vim-sneak'
    Plug 'szw/vim-maximizer'
    Plug 'folke/neodev.nvim'

    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

    " Themes
    Plug 'rose-pine/neovim', {'as': 'rose-pine'}

call plug#end()

