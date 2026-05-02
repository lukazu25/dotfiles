vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.winborder = "rounded"
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
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

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>ff', function() require("fzf-lua").files() end, { desc = 'find files' })
vim.keymap.set('n', '<leader>fr', function() require("fzf-lua").oldfiles() end, { desc = 'open recent files' })
vim.keymap.set('n', '<leader>fb', function() require("fzf-lua").buffers() end, { desc = 'find buffers' })
vim.keymap.set('n', '<leader>fg', function() require("fzf-lua").live_grep() end, { desc = 'live grep' })
vim.keymap.set('n', '<leader>fh', function() require("fzf-lua").helptags() end, { desc = 'view help' })
vim.keymap.set("n", "<leader>e",  function() require("mini.files").open() end, { desc = 'open file explorer' })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = 'lsp format' })

vim.pack.add({
    { src = "https://github.com/AstroNvim/astrotheme" },
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-mini/mini.files" },
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("astrotheme").setup()
vim.cmd.colorscheme('astrodark')

require("mini.icons").setup()
require("mason").setup()
require("mini.files").setup()
require('fzf-lua').setup({ fzf_colors = true })
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
