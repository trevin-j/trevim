-- For `plugins/markview.lua` users.
return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  opts = {
    file_types = { 'markdown', 'vimwiki' },
    completions = {
      lsp = {
        enabled = true,
      },
    },
  },
};
