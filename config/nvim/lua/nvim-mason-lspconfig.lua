require('mason-lspconfig').setup({
  ensure_installed = {
    -- Replace these with whatever servers you want to install
    'lua_ls',
    'bashls',  
    'pylsp', -- pip3 install python-lsp-server
  }
})
