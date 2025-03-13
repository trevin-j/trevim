return {
  'smoka7/hop.nvim',
  branch = 'v2',
  config = function()
    local hop = require('hop')
    hop.setup {
      keys = 'ntesiroaufcywxhdlp',
    }
    local directions = require('hop.hint').HindDirection
    vim.keymap.set('n', 'f', function()
      hop.hint_char1 {
        direction = directions.AFTER_CURSOR,
      }
    end, { desc = 'Hop to character after cursor', remap = true })
    vim.keymap.set('n', 'F', function()
      hop.hint_char1 {
        direction = directions.BEFORE_CURSOR,
      }
    end, { desc = 'Hop to character before cursor', remap = true })
    vim.keymap.set('n', 't', function()
      hop.hint_char2 {
        direction = directions.AFTER_CURSOR,
      }
    end, { desc = 'Hop to two characters after cursor', remap = true })
  end,
}
