return {
  'scottmckendry/cyberdream.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require 'cyberdream'.setup {
      transparent = false,
    }
    vim.cmd("colorscheme cyberdream")
  end,
  -- dir = '~/dev/neonsign.nvim',
  -- dependencies = 'rktjmp/lush.nvim',
  -- init = function()
  --   vim.cmd('colorscheme neonsign')
  -- end,
}
