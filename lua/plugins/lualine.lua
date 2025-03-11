return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '│', right = '│'},
          section_separators = { left = '│', right = '│'},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'diagnostics', 'filename'},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {'encoding', 'filesize'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {
          lualine_a = {},
          lualine_b = {'filetype'},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {'searchcount', 'selectioncount'},
          lualine_z = {'location', 'progress'}
        },
        inactive_winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filetype'},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        extensions = {}
      }
    end,
  },
}
