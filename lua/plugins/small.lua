-- This file is a collection of plugins with a small config that don't necessarily need their own files.
-- Not to be confused with mini.nvim cfg.
return {
  'tpope/vim-sleuth',
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  'github/copilot.vim',
}
