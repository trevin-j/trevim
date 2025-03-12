return {

  -- "EdenEast/nightfox.nvim",
  -- config = function()
  --     vim.cmd("colorscheme carbonfox")
  -- end,


  -- 'rebelot/kanagawa.nvim',
  -- config = function()
  --   require('kanagawa').setup {
  --     background = {
  --       dark = 'dragon',
  --     }
  --   }
  --   vim.cmd("colorscheme kanagawa")
  -- end,


  -- 'navarasu/onedark.nvim',
  -- config = function()
  --   require('onedark').setup {
  --     style = 'darker',
  --     transparent = true,
  --   }
  --   vim.cmd("colorscheme onedark")
  -- end,


  'scottmckendry/cyberdream.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require 'cyberdream'.setup {
      transparent = true,
    }
    vim.cmd("colorscheme cyberdream")
  end,
}
