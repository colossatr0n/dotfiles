" For some reason, ideavimrc can only reference this as a local var. 
let lsp_keybindings = {
            \ 'goToDeclaration'        : 'gD',
            \ 'goToDefinition'         : 'gd',
            \ 'previewDefinition'      : '<leader>pd',
            \ 'reformat'               : '<leader>f',
            \ 'goToImplementation'     : '<leader>i',
            \ 'signatureHelp'          : '<leader>pi',
            \ 'goToTypeDefinition'     : '<leader>t',
            \ 'rename'                 : '<leader>r',
            \ 'codeAction'             : '<leader>a',
            \ 'references'             : '<leader>u',
            \
            \ 'showErrorDescription'   : '<leader>e',
            \ 'hoverDoc'               : 'K',
            \ 'goToNextError'          : ']e',
            \ 'goToPreviousError'      : '[e',
            \
            \ 'showErrorWindow'        : '<leader>lv',
            \ 'scrollUpPreviewWindow'  : '<C-f>',
            \ 'scrollDownPreviewWindow': '<C-b>',
            \
            \ 'addWorkspaceFolder'     : '<leader>wa',
            \ 'removeWorkspaceFolder'  : '<leader>wr',
            \ 'showWorkspaceFolders'   : '<leader>wl' 
\}

" Set to global so that lua scripts can access it (vim.g.someGlobalVar)
let g:lsp_keybindings = lsp_keybindings


