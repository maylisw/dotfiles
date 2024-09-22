-- [[ keymaps.lua ]] ---

-- Use ESC in normal mode to clear search highlighting
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

------ Diagnostics ------
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uick fix list' })

------ Terminal ------
-- Use ESC+ESC to exit terminal job mode and go to normal mode
-- disabled since it won't work with all terminals, use <C-w>N instead
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

------ Window navigation ------
-- Use CTRL+<hjkl> to navigate instead of <CTRL-w>+<CTRL-<hjkl>>
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

------ Autocomands ------
-- highlight what we yanked
vim.api.nvim_create_autocmd('TextYankPost', { -- listen to TextYankPost event
   desc = 'Highlight when yanking text',
    -- create group to prevent duplicate listeners
   group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
   callback = function()
     vim.highlight.on_yank()
   end,
})

-- vim: ts=2 sts=2 sw=2 et
