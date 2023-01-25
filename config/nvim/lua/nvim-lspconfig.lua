local nvim_lsp = require('lspconfig')
local HOME = os.getenv("HOME")
vim.cmd('source ~/dotfiles/config/nvim/vimscript/lsp-keybindings.vim')

-- SET UP KEYBINDINGS
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', vim.g.lsp_keybindings['goToDeclaration'],           '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['goToDefinition'],            '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['previewDefinition'],         '<cmd>Lspsaga peek_definition<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['hoverDoc'],                  '<cmd>Lspsaga hover_doc<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['finder'],                    '<cmd>Lspsaga lsp_finder<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['goToImplementation'],        '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['signatureHelp'],             '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['addWorkspaceFolder'],        '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['removeWorkspaceFolder'],     '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['showWorkspaceFolders'],      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['goToTypeDefinition'],        '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['rename'],                    '<cmd>Lspsaga rename<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['codeAction'],                '<cmd>Lspsaga code_action<CR>', opts)
  -- buf_set_keymap('n', vim.g.lsp_keybindings['references'],                '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['showErrorDescription'],      '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['goToPreviousDiagnostic'],    '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['goToNextDiagnostic'],        '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['goToPreviousError'],         '<cmd>lua require("lspsaga.diagnostic").goto_prev({ severity = "Error" })<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['goToNextError'],             '<cmd>lua require("lspsaga.diagnostic").goto_next({ severity = "Error" })<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['showErrorWindow'],           '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', vim.g.lsp_keybindings['reformat'],                  '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

local cmp = require('nvim-cmp')

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches. Also add autocompletions.
local servers = { 
    'tsserver', 
    'angularls',
    'html',
    'vuels',
    'bashls',
    'pylsp' -- pip3 install python-lsp-server
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    single_file_support = true,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }
end

-- Not able to add swift/cpp stuff the normal way. Adding it manually.
nvim_lsp['sourcekit'].setup {
    cmd = { "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp" },
    filetypes = { "swift", "objective-c", "objective-cpp", "objc" },
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}

-- Not able to add java the normal way
nvim_lsp['java_language_server'].setup {
    cmd = { HOME .. '/code/language-servers/java-language-server-master/dist/lang_server_mac.sh' },
    on_attach = on_attach,
    single_file_support = true,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}

nvim_lsp['clangd'].setup {
    cmd = { "/usr/local/opt/llvm/bin/clangd" },
    on_attach = on_attach,
    single_file_support = true,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

-- NPM installs for language servers
-- npm install -g typescript typescript-language-server
-- angular-language-server can be installed via npm install -g @angular/language-server.
-- npm i -g vscode-langservers-extracted

