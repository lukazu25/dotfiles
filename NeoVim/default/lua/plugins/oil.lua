return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        view_options = {
            show_hidden = true,
        },
    },
    dependencies = {
        { "nvim-tree/nvim-web-devicons" }
    },
    keys = {
        { "<leader>e", "<cmd>Oil<CR>", desc = "Open Parent Directory in Oil" }
    },
    lazy = false,
}
