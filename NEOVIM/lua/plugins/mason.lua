return {
  'williamboman/mason.nvim',
  enabled = true,
  config = function ()
  
   require('mason').setup()

    -- Initialize mason-lspconfig plugin, which bridges mason and nvim-lspconfig
    require('mason-lspconfig').setup({
      ensure_installed = {
        'lua_ls',  -- Ensure Lua language server is installed
        -- You can add other language servers here as needed
      },
      handlers = {
        function(server_name)        
          vim.lsp.config(server_name, {            
          })         
        end,

        ['lua_ls'] = function ()
          vim.lsp.config('lua_ls', {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'bit', 'vim', 'it', 'describe', 'before_each', 'after_each' },
                }
              }
            }
          })
        end
      }
    })

    vim.keymap.set('n', '<C-m>', '<cmd>Mason<cr>', { desc = 'Run Mason' })
  end
}
