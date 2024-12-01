return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    auto_install = true,
    highlights = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  dependencies = {
    {
      {
        'rayliwell/tree-sitter-rstml',
        dependencies = { 'nvim-treesitter' },
        build = ':TSUpdate',
        config = function()
          require('tree-sitter-rstml').setup()
        end,
      },
    },
  },
}
