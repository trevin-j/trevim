return {
  'smoka7/hop.nvim',
  tag = 'v2.7.2',
  config = function()
    local hop = require('hop')
    hop.setup {
      keys = 'ntesiroaufcywxhdlp',
    }
    -- Better f/F/t/T
    local directions = require('hop.hint').HintDirection
    vim.keymap.set('n', 'f', function()
      hop.hint_char1 {
        direction = directions.AFTER_CURSOR,
        current_line_only = true,
      }
    end, { desc = 'Hop to character after cursor', remap = true })
    vim.keymap.set('', 'F', function()
      hop.hint_char1 {
        direction = directions.BEFORE_CURSOR,
        current_line_only = true,
      }
    end, { desc = 'Hop to character before cursor', remap = true })
    vim.keymap.set('', 't', function()
      hop.hint_char1 {
        direction = directions.AFTER_CURSOR,
        current_line_only = true,
        hint_offset = -1,
      }
    end, { desc = 'Hop to before character after cursor', remap = true })
    vim.keymap.set('', 'T', function()
      hop.hint_char1 {
        direction = directions.BEFORE_CURSOR,
        current_line_only = true,
        hint_offset = 1,
      }
    end, { desc = 'Hop to after character before cursor', remap = true })

    -- Navigating anywhere in buffer with s/S
    vim.keymap.set('', 's', function()
      hop.hint_char2 {
        direction = directions.AFTER_CURSOR,
        current_line_only = false,
      }
    end, { desc = 'Hop to character after cursor', remap = true })
    vim.keymap.set('', 'S', function()
      hop.hint_char2 {
        direction = directions.BEFORE_CURSOR,
        current_line_only = false,
      }
    end, { desc = 'Hop to character before cursor', remap = true })
  end,
}
