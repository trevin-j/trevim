return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  config = function()
    require('oil').setup {
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        case_insensitive = true,
      }
    }
    vim.api.nvim_set_keymap('n', '<leader>e.', '<CMD>Oil --float<CR>', { noremap = true })
  end,
}
