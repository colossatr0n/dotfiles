local saga = require 'lspsaga'

-- add your config value here
-- default value
-- code_action_prompt = {
--   enable = true,
--   sign = true,
--   sign_priority = 20,
--   virtual_text = true,
-- },
-- finder_definition_icon = '  ',
-- finder_reference_icon = '  ',
-- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
-- finder_action_keys = {
--   open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
-- },
-- code_action_keys = {
--   quit = 'q',exec = '<CR>'
-- },
-- rename_action_keys = {
--   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
-- },
-- definition_preview_icon = '  '
-- "single" "double" "round" "plus"
-- border_style = "single"
-- rename_prompt_prefix = '➤',
-- if you don't use nvim-lspconfig you must pass your server name and
-- the related filetypes into this table
-- like server_filetype_map = {metals = {'sbt', 'scala'}}
-- server_filetype_map = {}

saga.init_lsp_saga {
 error_sign = 'ⓧ',
 warn_sign = '⚠',
 hint_sign = '💡',
 infor_sign = 'ⓘ',
 dianostic_header_icon = '■',
 code_action_icon = '💡',
 use_saga_diagnostic_sign = true
}

-- or --use default config
--saga.init_lsp_saga()

vim.api.nvim_set_keymap('n', '<A-d>', '<cmd>lua require("lspsaga.floaterm").open_float_terminal()<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('t', '<A-d>', '<C-\\><C-n>:lua require("lspsaga.floaterm").close_float_terminal()<CR>', { noremap=true, silent=true })
