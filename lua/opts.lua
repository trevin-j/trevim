vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.rnu = true
vim.opt.mouse = 'a'
vim.opt.showmode = false -- Don't show because we have a statusline.
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'auto'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
-- While I wanted to make tabs obvious so we don't use them...
-- Godot forced my hand by using tabs for indentation.
-- So let's at least make them look good.
vim.opt.tabstop = 4
vim.opt.wrap = false

-- We want full color support!
vim.opt.termguicolors = true

-- Move cursor to start of line on big motions.
vim.opt.startofline = true

-- Folds!!
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = true
vim.opt.foldlevel = 99

-- Enable filetype plugins!
vim.cmd('filetype plugin on')

-- Change how diagnostics are displayed!
vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}

vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
      if vim.api.nvim_win_get_config(winid).zindex then
        return
      end
    end
    local opts = {
      focusable = false,
      close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end,
})

-- Auto update Lazy plugins on startup!
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if require('lazy.status').has_updates() then
      require('lazy').update {
        show = false,
      }
    end
  end,
})

vim.g.have_nerd_font = true
