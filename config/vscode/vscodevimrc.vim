" mapclear
let mapleader=" "
source ~/dotfiles/config/nvim/vimscript/lsp-keybindings.vim

" Uses LSP keybindings.
execute 'nnoremap '.lsp_keybindings['previewDefinition'].      ' <cmd>lua require(''vscode'').action(''editor.action.showDefinitionPreviewHover'')<CR>'
execute 'nnoremap '.lsp_keybindings['goToImplementation'].     ' <cmd>lua require(''vscode'').action(''editor.action.goToImplementation'')<CR>'
execute 'nnoremap '.lsp_keybindings['signatureHelp'].          ' <cmd>lua require(''vscode'').action(''editor.action.triggerParameterHints'')<CR>'
execute 'nnoremap '.lsp_keybindings['goToTypeDefinition'].     ' <cmd>lua require(''vscode'').action(''editor.action.goToTypeDefinition'')<CR>'
execute 'nnoremap '.lsp_keybindings['codeAction'].             ' <cmd>lua require(''vscode'').action(''editor.action.codeAction'')<CR>'
execute 'nnoremap '.lsp_keybindings['references'].             ' <cmd>lua require(''vscode'').action(''editor.action.referenceSearch.trigger'')<CR>'
execute 'nnoremap '.lsp_keybindings['showErrorDescription'].   ' <cmd>lua require(''vscode'').action(''editor.action.showHover'')<CR>'
execute 'nnoremap '.lsp_keybindings['reformat'].               ' <cmd>lua require(''vscode'').action(''editor.action.formatDocument'')<CR>'
execute 'nnoremap '.lsp_keybindings['showErrorWindow'].        ' <cmd>lua require(''vscode'').action(''workbench.action.problems.focus'')<CR>'
execute 'nnoremap '.lsp_keybindings['goToNextError'].          ' <cmd>lua require(''vscode'').action(''editor.action.marker.next'')<CR>'
execute 'nnoremap '.lsp_keybindings['goToPreviousError'].      ' <cmd>lua require(''vscode'').action(''editor.action.marker.prev'')<CR>'
execute 'nnoremap '.lsp_keybindings['goToDefinition'].         ' <cmd>lua require(''vscode'').action(''editor.action.revealDefinition'')<CR>'
execute 'nnoremap '.lsp_keybindings['hoverDoc'].               ' <cmd>lua require(''vscode'').action(''editor.action.showHover'')<CR>'
execute 'nnoremap '.lsp_keybindings['searchForFile'].          ' <cmd>lua require(''vscode'').action(''workbench.action.quickOpen'')<CR>'
execute 'nnoremap '.lsp_keybindings['searchWorkspaceSymbols']. ' <cmd>lua require(''vscode'').action(''workbench.action.gotoSymbol'')<CR>'
execute 'nnoremap '.lsp_keybindings['quickSwitch'].            ' <cmd>lua require(''vscode'').action(''workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup'')<CR>'
" execute 'nnoremap '.lsp_keybindings['goToPreviousWindow'].     ' <cmd>lua require(''vscode'').action(''workbench.action.previousEditor'')<CR>'
execute 'nnoremap '.lsp_keybindings['goToPreviousWindow'].' <c-w><c-p>'
execute 'nnoremap '.lsp_keybindings['searchDocumentSymbols'].  ' <cmd>lua require(''vscode'').action(''workbench.action.gotoSymbol'')<CR>'
execute 'nnoremap '.lsp_keybindings['searchForWord'].          ' <cmd>lua require(''vscode'').action(''workbench.action.findInFiles'', { args = { query = vim.fn.expand(''<cword>'') } })<CR>'

" These should match git gutter bindings
execute 'nnoremap '.lsp_keybindings['previousChange'].          ' <cmd>lua require(''vscode'').action(''workbench.action.editor.previousChange'')<CR>'
execute 'nnoremap '.lsp_keybindings['nextChange'].          ' <cmd>lua require(''vscode'').action(''workbench.action.editor.nextChange'')<CR>'
execute 'nnoremap '.lsp_keybindings['revertChange'].          ' <cmd>lua require(''vscode'').action(''git.revertSelectedRanges'')<CR>'
execute 'nnoremap '.lsp_keybindings['previewChange'].          ' <cmd>lua require(''vscode'').action(''editor.action.dirtydiff.next'')<CR>'

" Similar to vim-maximize plugin
execute 'noremap '.lsp_keybindings['maximizeWindow'].          ' <cmd>lua require(''vscode'').action(''workbench.action.toggleMaximizeEditorGroup'')<CR>'

execute 'noremap '.lsp_keybindings['explorerOpen'].          ' <cmd>lua require(''vscode'').action(''workbench.files.action.focusFilesExplorer'')<CR>'
execute 'noremap '.lsp_keybindings['explorerClose'].          ' <cmd>lua require(''vscode'').action(''workbench.action.closeSidebar'')<CR>'
execute 'noremap '.lsp_keybindings['explorerFind'].          ' <cmd>lua require(''vscode'').action(''workbench.files.action.showActiveFileInExplorer'')<CR>'


lua << EOF

-- Got this from: https://github.com/vscode-neovim/vscode-neovim/issues/1091#issuecomment-2228316698
-- Uses jumplist vscode plugin: https://marketplace.visualstudio.com/items?itemName=spacian.jumplist
if vim.g.vscode then
  local vscode = require("vscode")
  local previous_jumplist = vim.fn.getjumplist()[1]

  local function jump_back()
    vscode.call("jumplist.jumpBack")
  end

  local function jump_forw()
    vscode.call("jumplist.jumpForward")
  end

-- this is not nice, but does the job for now
  local function goToDef()
    vscode.call("jumplist.registerJump")
    vscode.call("editor.action.revealDefinition")
  end

  vim.keymap.set({ "n" }, "<c-o>", jump_back, { noremap = true })
  vim.keymap.set({ "n" }, "<c-i>", jump_forw, { noremap = true })
  vim.keymap.set({ "n" }, "gd", goToDef, { noremap = true })

  local function check_jumplist()
    local current_jumplist = vim.fn.getjumplist()[1]
    if #current_jumplist > #previous_jumplist then
      vscode.call("jumplist.registerJump")
    end
    previous_jumplist = current_jumplist
  end

  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    callback = check_jumplist,
  })
end

EOF
