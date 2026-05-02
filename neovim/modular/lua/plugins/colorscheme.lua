return {
	"AstroNvim/astrotheme",
	lazy = false,
	priority = 1000,
	config = function()
		require("astrotheme").setup({})
		vim.cmd("colorscheme astrodark")
	end,
}
