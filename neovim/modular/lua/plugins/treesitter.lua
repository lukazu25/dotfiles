return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup()

      require('nvim-treesitter').install({ 'lua', 'vim', 'vimdoc' })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'lua', 'vim', 'vimdoc' },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end
  }
}
