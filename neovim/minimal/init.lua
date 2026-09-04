vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_altfile = 1
vim.g.netrw_dirhistmax = 0
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.winborder = "rounded"
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.showtabline = 1
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert', 'fuzzy', 'nosort' }

vim.pack.add({
    { src = "https://github.com/oskarnurm/koda.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("koda").setup()
vim.cmd.colorscheme('koda')

require("mason").setup()
require('nvim-treesitter').setup()
require('nvim-treesitter').install { 'lua', 'vim', 'vimdoc' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'vim', 'vimdoc' },
  callback = function() vim.treesitter.start() end,
})


vim.lsp.enable({ "lua_ls", "clangd" })
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})
