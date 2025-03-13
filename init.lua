require("opts")
require("bootstrap")

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Pres ESC to clear highlights from search
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' }) -- Esc twice to exit terminal mode

-- Nicer split nav
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

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

-- Tmux auto rename windows!
local uv = vim.uv

vim.api.nvim_create_autocmd({ 'VimEnter', 'VimLeave' }, {
	callback = function()
		if vim.env.TMUX_PLUGIN_MANAGER_PATH then
			uv.spawn(vim.env.TMUX_PLUGIN_MANAGER_PATH .. '/tmux-window-name/scripts/rename_session_windows.py', {})
		end
	end,
})




