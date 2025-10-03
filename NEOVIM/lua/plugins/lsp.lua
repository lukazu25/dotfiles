return {
  -- Neovim built-in LSP configuration
  'neovim/nvim-lspconfig',
  enabled = true,
  lazy = false,
  dependencies = {
    -- Mason LSPconfig: Extension to mason.nvim to automatically set up LSP servers
    'williamboman/mason-lspconfig.nvim',

    -- Nvim-cmp: A completion engine plugin for Neovim written in Lua
    'hrsh7th/nvim-cmp',

    -- nvim-cmp source for LSP
    'hrsh7th/cmp-nvim-lsp',

    -- nvim-cmp source for buffer words
    'hrsh7th/cmp-buffer',

    -- nvim-cmp source for filesystem paths
    'hrsh7th/cmp-path',

    -- nvim-cmp source for Neovim's command-line
    'hrsh7th/cmp-cmdline',

    -- LuaSnip: A snippet engine for Neovim written in Lua
    'L3MON4D3/LuaSnip',

    -- nvim-cmp source for LuaSnip
    'saadparwaiz1/cmp_luasnip',

    -- Fidget: Standalone UI for nvim-lsp progress. Eye candy for the impatient.
    'j-hui/fidget.nvim',

    -- lspkind for awesome icons
    'onsails/lspkind.nvim'
  },

  config = function ()
    require('fidget').setup({})
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')

    
    vim.lsp.config('lua_ls', {
      cmd = { "lua-language-server" },
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          telemetry = { enable = false },
        },
      },
    })

    -- local vue_language_server_path = '/path/to/@vue/language-server'
    -- vim.lsp.config('ts_ls', {
    --   init_options = {
    --     plugins = {
    --       {
    --         name = '@vue/typescript-plugin',
    --         location = vue_language_server_path,
    --         languages = { 'vue' },
    --       },
    --     },
    --   },
    --   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    -- })


    -- Setup completion configuration for nvim-cmp 
    cmp.setup({
      snippet = {
        expand = function (args)
          luasnip.lsp_expand(args.body)
        end
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
         },
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
      }),

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

      experimental = {
        ghost_text = true
      }
    })

    -- Setup completion configuration for search command-line mode 
    cmp.setup.cmdline({ '?', '/' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Setup completion configuration for command-line mode 
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
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { desc = "Go to definition" })
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, { desc = "Hover" })
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, { desc = "Workspace symbol" })
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, { desc = "Open diagnostic float" })
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, { desc = "Code action" })
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, { desc = "References" })
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, { desc = "Rename" })
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, { desc = "Next diagnostic" })
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, { desc = "Previous diagnostic" })
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, { desc = "Signature help" })
  end
}
