return {
  'Wansmer/treesj',
  keys = {'<leader>cs'},
  opts = {
    use_default_keymaps = false,
  },
  init = function()
    vim.keymap.set('n', '<leader>cs', require('treesj').toggle, { desc = "Toggle split join" })
  end,
}
