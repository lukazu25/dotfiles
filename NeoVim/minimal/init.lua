vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.winborder = "rounded"
vim.opt.cursorcolumn = false
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showtabline = 0
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true

local map = vim.keymap.set

vim.g.mapleader = " "
map({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
map({ "n", "v", "x" }, "<leader>d", '"+d<CR>')
map({ "n", "v", "x" }, "<leader>s", ':e #<CR>')
map({ "n", "v", "x" }, "<leader>S", ':sf #<CR>')
map("n", "<leader>f", ":Pick files<CR>")
map("n", "<leader>h", ":Pick help<CR>")
map("n", "<leader>e", ":Oil<CR>")
map("n", "<leader>lf", vim.lsp.buf.format)


vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
})


require("vague").setup({ italic = false, bold = true })
vim.cmd("colorscheme vague")


require "mason".setup()
require "mini.pick".setup()
require "oil".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = { "lua", "c" },
	highlight = { enable = true }
})


vim.lsp.enable({ "lua_ls", "clangd" })
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			}
		}
	}
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd [[set completeopt+=menuone,noselect,popup]]

