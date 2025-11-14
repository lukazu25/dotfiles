return {
  'nvim-neo-tree/neo-tree.nvim',
  enabled = true,
  lazy = true,
  cmd = 'Neotree',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
  },
  opts = {
    window = {
      position = "left",
      width = 30,
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
      }
    },
  },
  keys = {
    {
      '<leader>n',
      '<cmd>Neotree toggle<CR>',
      desc = 'Toggle Neo-tree',
    }
  }
}
