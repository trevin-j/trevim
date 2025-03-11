return {
  'zbirenbaum/copilot.lua',
  event = 'InsertEnter',
  cmd = { 'Copilot' },
  config = function()
    require('copilot').setup {
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = '<M-[>',
          jump_next = '<M-]>',
          accept = '<CR>',
          refresh = '<M-r>',
          open = '<M-CR>',
        },
        layout = {
          position = 'bottom',
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = false,
        debounce = 75,
        keymap = {
          accept = '<M-Tab>',
          accept_word = '<C-Tab>',
          accept_line = false,
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
      },
      filetypes = {
        yaml = true,
        markdown = true,
        help = false,
      },
      copilot_node_command = 'node',
      server_opt_overrides = {}
    }
  end,
}
