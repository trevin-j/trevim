return {
  'RRethy/vim-illuminate',
  config = function()
    require('illuminate').configure {
      modes_denylist = {'i'},
    }
  end,
}
