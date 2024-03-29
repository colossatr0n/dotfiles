augroup ProjectDrawer
  " Exit Vim if NERDTree is the only window remaining in the only tab.
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
  autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
      \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
augroup END


execute 'nnoremap '.lsp_keybindings['explorerOpen' ].' :NERDTreeFocus<CR>'
execute 'nnoremap '.lsp_keybindings['explorerClose'].' :NERDTreeClose<CR>'
execute 'nnoremap '.lsp_keybindings['explorerFind' ].' :NERDTreeFind<CR> '

" nnoremap <leader>eo :NERDTreeFocus<CR>
" nnoremap <leader>ec :NERDTreeClose<CR>
" nnoremap <leader>ef :NERDTreeFind<CR>
