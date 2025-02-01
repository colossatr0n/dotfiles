" For some reason, ideavimrc can only reference this as a local var. 
let lsp_keybindings = {
            \ 'goToDeclaration'        : 'gD',
            \ 'goToDefinition'         : 'gd',
            \ 'previewDefinition'      : '<leader>pd',
            \ 'reformat'               : '<leader>rf',
            \ 'goToImplementation'     : 'gI',
            \ 'signatureHelp'          : '<leader>pi',
            \ 'goToTypeDefinition'     : 'gty',
            \ 'rename'                 : '<leader>rn',
            \ 'codeAction'             : '<leader>a',
            \ 'finder'                 : '<leader>u',
            \ 'references'             : 'gr',
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
            \ 'showWorkspaceFolders'   : '<leader>wl', 
            \ 'goToPreviousWindow'     : '<leader>w', 
            \ 'searchForFile'          : '<leader>sf', 
            \ 'searchDocumentSymbols'  : '<leader>ds', 
            \ 'searchWorkspaceSymbols' : '<leader>ws',
            \ 'searchForWord'          : '<leader>sw',
            \
            \ 'explorerOpen'           : '<leader>eo',
            \ 'explorerClose'          : '<leader>ec',
            \ 'explorerFind'           : '<leader>ef',
            \
            \ 'previousChange'         : '[c',
            \ 'nextChange'             : ']c',
            \ 'revertChange'           : '<leader>hu',
            \ 'previewChange'          : '<leader>hp',
            \
            \ 'maximizeWindow'         : '<c-w>m',
\}


" Set to global so that lua scripts can access it (vim.g.someGlobalVar)
let g:lsp_keybindings = lsp_keybindings

" Unused key pairs
