return {
  'folke/flash.nvim',
  opts = {
    labels = 'arstgmneioqwfpbjluyzxcdvkh',
    modes = {
      search = {
        enabled = true, -- Enable search mode with / and ?
      },
      char = {
        enabled = false, -- We already override f/F/t/T with hop.nvim
      },
    },
  },
  keys = {
    { "<leader>st", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
}
