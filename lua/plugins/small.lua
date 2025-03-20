-- This file is a collection of plugins with a small config that don't necessarily need their own files.
-- Not to be confused with mini.nvim cfg.
return {
  'tpope/vim-sleuth',
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      }
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  -- {
  --   'lukas-reineke/indent-blankline.nvim',
  --   main = 'ibl',
  --   opts = {},
  -- },
  'ThePrimeagen/vim-be-good', -- Play a game to git gud ;) to play, go to empty file and do :VimBeGood
}
