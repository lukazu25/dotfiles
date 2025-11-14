return {
  'neovim/nvim-lspconfig',
  enabled = true,
  lazy = false,
  dependencies = {
    'mason-org/mason-lspconfig.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'j-hui/fidget.nvim',
    'onsails/lspkind.nvim'
  },

  config = function ()
    require('fidget').setup({
      notification = {
        window = {
           -- Explicitly tell Fidget to avoid rendering over the NvimTree window
          avoid = { 'NeoTree' }, 
        },
           -- Overrides vim.notify() so all notifications use Fidget's style.
        override_vim_notify = true,   
      },
    })
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')

    -- Place any other **server-specific** configurations here 
    -- if they are not managed by mason-lspconfig's handlers, 
    -- or if you need to override the default lspconfig setup.
    
    -- Example for a non-Mason-handled server config (e.g., ts_ls plugins):
    -- vim.lsp.config('ts_ls', { ... }) 

    local cmp_mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
      
      -- Tab and Shift-Tab for navigation
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
        else fallback() end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then luasnip.jump(-1)
        else fallback() end
      end, { 'i', 's' }),
    })

    -- Setup completion configuration for nvim-cmp 
    cmp.setup({
      snippet = { expand = function (args) luasnip.lsp_expand(args.body) end },
      mapping = cmp_mapping,
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' }
      }, {
        { name = 'buffer' },
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
          show_labelDetails = true,
        })
      },
      experimental = { ghost_text = true }
    })

    -- Setup completion for command-line modes
    cmp.setup.cmdline({ '?', '/' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = 'buffer' } }
    })
    
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    -- LSP Keymaps 
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover" })
    vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, { desc = "Workspace symbol" })
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, { desc = "Open diagnostic float" })
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, { desc = "Code action" })
    vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, { desc = "References" })
    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, { desc = "Rename" })
    vim.keymap.set('n', '[d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, { desc = "Signature help" })
  end
}
