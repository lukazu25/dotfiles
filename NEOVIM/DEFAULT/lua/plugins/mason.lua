return {
  'mason-org/mason.nvim',
  enabled = true,
  config = function()
    -- 1. Setup Mason
    require('mason').setup()

    -- 2. Define custom LSP configurations *before* setting up mason-lspconfig
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            -- Add common global variables used in your Neovim/testing environment
            globals = { 'vim', 'it', 'describe', 'before_each', 'after_each' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false, -- Optional: May speed up startup
          },
          telemetry = { enable = false },
        }
      }
    })

    -- 3. Setup mason-lspconfig to ensure servers are installed and automatically enabled
    require('mason-lspconfig').setup({
      ensure_installed = {
        'lua_ls',
        -- Add other servers for auto-installation here (e.g., 'pyright', 'tsserver')
      },
      -- Handlers are no longer necessary as configuration is done via vim.lsp.config()
      -- mason-lspconfig will now automatically enable servers using vim.lsp.enable(),
      -- which uses the config defined above.
    })

    -- Keymap
    vim.keymap.set('n', '<C-m>', '<cmd>Mason<cr>', { desc = 'Run Mason' })
  end
}
