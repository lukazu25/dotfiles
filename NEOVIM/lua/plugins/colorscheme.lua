return {
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme carbonfox")
    end,
  },
}

--return {
  --'shaunsingh/nord.nvim',
  --priority = 1000,
  --config = function()
    --vim.cmd.colorscheme('nord')
  --end,
--}

--return {
  --'sainnhe/gruvbox-material',
  --priority = 1000,
  --config = function()
  --vim.g.gruvbox_material_enable_italic = true
   --vim.cmd.colorscheme('gruvbox-material')
  --end,
--}
