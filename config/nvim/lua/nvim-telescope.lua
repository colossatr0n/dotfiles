vim.cmd('source ~/dotfiles/config/nvim/vimscript/lsp-keybindings.vim')

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
        ".*~"
    },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  pickers = {
    find_files = {
        mappings = {
        n = {
            -- Changes pwd to directory of selected file
            ["cd"] = function(prompt_bufnr)
                local selection = require("telescope.actions.state").get_selected_entry()
                local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                require("telescope.actions").close(prompt_bufnr)
                -- Depending on what you want put `cd`, `lcd`, `tcd`
                vim.cmd(string.format("silent lcd %s", dir))
            end,
        }
      }
    }
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', function() 
    require('telescope.builtin').buffers({sort_lastused=true})
end,                                                                    { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', vim.g.lsp_keybindings['searchForFile'],  require('telescope.builtin').find_files,  { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh',  require('telescope.builtin').help_tags,   { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>scw', require('telescope.builtin').grep_string, { desc = '[S]earch [C]urrent [W]ord' })

vim.keymap.set('n', vim.g.lsp_keybindings['searchForWord'],
    require('telescope.builtin').live_grep,                                  { desc = '[S]earch for [W]ord (ripgrep)' })

vim.keymap.set('n', '<leader>sbw', function() 
    require('telescope.builtin').live_grep({grep_open_files=true})
end,                                                                         { desc = '[S]earch [B]uffers for [W]ord'})

vim.keymap.set('n', '<leader>sd',  require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sg',  require('telescope.builtin').git_files,   { desc = '[S]earch [G]it Files' })
vim.keymap.set('n', '<leader>sk',  require('telescope.builtin').keymaps,     { desc = '[S]earch [K]eymaps' })

