-- Yes! Autocompletion! so sexy
return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Add additional completion and snippet engines here :3
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    local cmp = require 'cmp'

    cmp.setup {
      -- Has to do with an issue with Godot's LSP! The issue will be fixed with Godot 4.4!
      -- Once Godot 4.4 is released, this line can be uncommented!
      -- If there are any autocomplete issues until then, uncomment this line and find a way to change this for
      -- GDScript files only!
      -- completion = { completeopt = 'menu,menuone,noinsert' },
      mapping = cmp.mapping.preset.insert {
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete {}, -- Not sure this is necessary?
      },
      sources = {
        {
          name = 'lazydev',
          group_index = 0,
        },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'render-markdown' },
      },
    }
  end,
}
