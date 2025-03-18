return {
  'smoka7/hop.nvim',
  tag = 'v2.7.2',
  config = function()
    local hop = require('hop')
    hop.setup {
      keys = 'ntesiroahd,cufyw.x', -- keys for navigagion. These ones I made for colemak dh layout
    }

    -- Better f/t
    vim.keymap.set({'n', 'o', 'x'}, 'f', function()
      local start_col = vim.api.nvim_win_get_cursor(0)[2]
      hop.hint_char1 {
        current_line_only = true,
      }
      local end_col = vim.api.nvim_win_get_cursor(0)[2]
      local mode = vim.api.nvim_get_mode().mode
      -- weird logid with operator pending mode
      if end_col < start_col and mode == 'no' then
        vim.cmd('normal! h')
      end
    end, { desc = 'Hop to character in line', remap = true })

    vim.keymap.set({'n', 'o', 'x'}, 't', function()
      local start_col = vim.api.nvim_win_get_cursor(0)[2]
      local mode = vim.api.nvim_get_mode().mode
      hop.hint_char1({
        current_line_only = true,
      })
      local end_col = vim.api.nvim_win_get_cursor(0)[2]
      -- weird logid with operator pending mode
      if end_col < start_col and mode ~= 'no' then
        vim.cmd('normal! l')
      elseif end_col > start_col then
        vim.cmd('normal! h')
      end
    end, { desc = 'Hop to character in line, offset one', remap = true })

    -- Navigating anywhere in buffer with F/T
    vim.keymap.set({'n', 'o', 'x'}, 'T', function()
      hop.hint_words {
        current_line_only = false,
      }
    end, { desc = 'Hop to word in file', remap = true })

    vim.keymap.set({'n', 'x', 'o'}, 'F', function()
      -- When using as operator motion, select whole lines instead of chars!
      if vim.api.nvim_get_mode().mode == 'o' then
        vim.cmd('normal! V')
      end
      hop.hint_lines {
        current_line_only = false,
      }
    end, { desc = 'Hop to line in file' })

  end,
}
