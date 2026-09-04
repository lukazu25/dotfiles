return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "igorlfs/nvim-dap-view",
  },

  config = function()
    require("nvim-dap-virtual-text").setup()
    require("dap-view").setup()
  end,

  keys = {
    { "<leader>dt", "<cmd>DapViewToggle<cr>", desc = "Toggle DAP view" },
    { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle breakpoint" },
    { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Continue debugging" },
    { "<leader>dw", "<cmd>DapViewWatch<cr>", desc = "Watch expression" },
  },
}
