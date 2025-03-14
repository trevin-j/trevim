require("opts")
require("bootstrap")

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Pres ESC to clear highlights from search
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' }) -- Esc twice to exit terminal mode

-- Buffer navigation with bh and bl
vim.keymap.set('n', '<C-h>', ':bprevious<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<C-l>', ':bnext<CR>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<C-Left>', ':bprevious<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', '<C-Right>', ':bnext<CR>', { desc = 'Go to next buffer' })

-- Highlight yank :)
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

