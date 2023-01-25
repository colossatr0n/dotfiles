" For some reason, ideavimrc can only reference this as a local var. 
let lsp_keybindings = {
            \ 'goToDeclaration'        : 'gD',
            \ 'goToDefinition'         : 'gd',
            \ 'previewDefinition'      : '<leader>pd',
            \ 'reformat'               : '<leader>rf',
            \ 'goToImplementation'     : '<leader>i',
            \ 'signatureHelp'          : '<leader>pi',
            \ 'goToTypeDefinition'     : '<leader>t',
            \ 'rename'                 : '<leader>rn',
            \ 'codeAction'             : '<leader>a',
            \ 'finder'                 : '<leader>u',
            \
            \ 'showErrorDescription'   : '<leader>e',
            \ 'hoverDoc'               : '<leader>hd',
            \ 'goToNextDiagnostic'     : ']d',
            \ 'goToPreviousDiagnostic' : '[d',
            \ 'goToNextError'          : ']e',
            \ 'goToPreviousError'      : '[e',
            \
            \ 'showErrorWindow'        : '<leader>lv',
            \
            \ 'addWorkspaceFolder'     : '<leader>wa',
            \ 'removeWorkspaceFolder'  : '<leader>wr',
            \ 'showWorkspaceFolders'   : '<leader>wl' 
\}

" Set to global so that lua scripts can access it (vim.g.someGlobalVar)
let g:lsp_keybindings = lsp_keybindings

" Unused key pairs
" \ 'references'             : '<leader>u',
