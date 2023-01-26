local saga = require 'lspsaga'

saga.setup {
 -- Error,Warn,Info,Hint
 diagnostic_header = { 'ⓧ', '⚠', 'ⓘ', '💡', },
 code_action_icon = '💡',
}
