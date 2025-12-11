return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
    },

    config = function()
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                },
            },
        })

        vim.lsp.enable({ "lua_ls", "clangd" })
    end,
}
