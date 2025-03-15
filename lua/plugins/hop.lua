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
    vim.keymap.set({'n', 'o', 'x'}, 'f', function()
      hop.hint_char1 {
        direction = directions.AFTER_CURSOR,
        current_line_only = true,
      }
    end, { desc = 'Hop to character after cursor', remap = true })
    vim.keymap.set({'n', 'o', 'x'}, 'F', function()
      hop.hint_char1 {
        direction = directions.BEFORE_CURSOR,
        current_line_only = true,
      }
    end, { desc = 'Hop to character before cursor', remap = true })
    vim.keymap.set({'n', 'o', 'x'}, 't', function()
      hop.hint_char1 {
        direction = directions.AFTER_CURSOR,
        current_line_only = true,
        hint_offset = -1,
      }
    end, { desc = 'Hop to before character after cursor', remap = true })
    vim.keymap.set({'n', 'o', 'x'}, 'T', function()
      hop.hint_char1 {
        direction = directions.BEFORE_CURSOR,
        current_line_only = true,
        hint_offset = 1,
      }
    end, { desc = 'Hop to after character before cursor', remap = true })

    -- Navigating anywhere in buffer with s/S
    vim.keymap.set({'n', 'o', 'x'}, 's', function()
      hop.hint_words {
        current_line_only = false,
      }
    end, { desc = 'Hop to character after cursor', remap = true })
    vim.keymap.set({'n', 'o', 'x'}, 'S', function()
      hop.hint_lines {
        current_line_only = false,
      }
    end, { desc = 'Hop to character before cursor', remap = true })
  end,
}
