return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby', 'gdscript' } },
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
