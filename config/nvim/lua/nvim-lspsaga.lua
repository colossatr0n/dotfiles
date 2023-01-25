local saga = require 'lspsaga'

saga.init_lsp_saga {
 -- Error,Warn,Info,Hint
 diagnostic_header = { 'ⓧ', '⚠', 'ⓘ', '💡', },
 code_action_icon = '💡',
}
