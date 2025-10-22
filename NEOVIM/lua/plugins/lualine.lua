return {
  'nvim-lualine/lualine.nvim',
  enabled = true,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {
          {
            'mode',
            icon = '',
            separator = { left = '', right = '' },
            padding = { left = 1, right = 1 },
          }
        },
        lualine_b = {
          {
            'branch',
            separator = { left = '', right = '' },
            padding = { left = 1, right = 1 },
          },
          {
            'diff',
            separator = { left = '', right = '' },
            padding = { left = 1, right = 1 },
          },
          {
            'diagnostics',
            separator = { left = '', right = '' },
            padding = { left = 1, right = 1 },
          },
        },

        lualine_c = {
          { 'filename' }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = {
          {
            'progress',
            separator = { left = '', right = '' },
            padding = { left = 1, right = 1 },
          }
        },

        lualine_z = {
          {
            'location',
            separator = { left = '', right = '' },
            padding = { left = 1, right = 1 },
          }
        }
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}
