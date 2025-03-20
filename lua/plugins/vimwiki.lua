return {
  'vimwiki/vimwiki',
  init = function()
    vim.cmd([[
      let g:vimwiki_list = [{'path': '~/Documents/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
    ]])

    -- vim.g.vimwiki_list = {
    --   {
    --     path = '~/Documents/vimwiki/',
    --     syntax = 'markdown',
    --     ext = '.md',
    --   },
    -- }
    vim.g.vimwiki_global_ext = 0
    vim.treesitter.language.register('markdown', 'vimwiki')
  end,
}
