return {
  'christoomey/vim-tmux-navigator',
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
    'TmuxNavigatePrevious',
  },
  keys = {
    { '<m-h>', '<cmd>TmuxNavigateLeft<cr>' },
    { '<m-j>', '<cmd>TmuxNavigateDown<cr>' },
    { '<m-k>', '<cmd>TmuxNavigateUp<cr>' },
    { '<m-l>', '<cmd>TmuxNavigateRight<cr>' },
    { '<m-\\>', '<cmd>TmuxNavigatePrevious<cr>' },
    -- Also use arrow keys
    { '<m-Left>', '<cmd>TmuxNavigateLeft<cr>' },
    { '<m-Down>', '<cmd>TmuxNavigateDown<cr>' },
    { '<m-Up>', '<cmd>TmuxNavigateUp<cr>' },
    { '<m-Right>', '<cmd>TmuxNavigateRight<cr>' },
  },
}
