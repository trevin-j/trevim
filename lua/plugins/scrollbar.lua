return {
  'petertriho/nvim-scrollbar',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    init = function()
      require('scrollbar.handlers.gitsigns').setup()
    end,
  },
  opts = {}
}
