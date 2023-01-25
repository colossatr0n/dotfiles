require('mason-lspconfig').setup({
  ensure_installed = {
    -- Replace these with whatever servers you want to install
    'sumneko_lua',
    'bashls',  
    'pylsp', -- pip3 install python-lsp-server
  }
})
