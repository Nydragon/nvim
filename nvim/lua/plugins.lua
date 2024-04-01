local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		init = function()
			require("nvim-tree-config")
		end,
		opts = {
			filters = {
				dotfiles = false,
				git_ignored = false,
			},
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		init = function()
			require("nvim-tree-config")
		end,
	},
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
			"lewis6991/gitsigns.nvim",
		},
		init = function()
			require("barbar-config")
		end,
	},
	"nvim-treesitter/nvim-treesitter",
	{
		"neovim/nvim-lspconfig", -- Configurations for Nvim LSP
		init = function()
			require("nvim-lsp-config")
		end,
	},
	"simrat39/rust-tools.nvim",
	"preservim/nerdcommenter", -- (batch)commenting tool
	{
		"m4xshen/autoclose.nvim",
		opts = require("autoclose-config"),
	},
	"lukas-reineke/indent-blankline.nvim",
	{
		"EdenEast/nightfox.nvim", -- themeing
		init = function()
			vim.cmd("colorscheme carbonfox")
		end,
		opts = {
			options = {
				styles = {
					comments = "italic",
					keywords = "bold",
					types = "italic,bold",
				},
			},
		},
	},
	"lukas-reineke/virt-column.nvim", -- thin bar indicating an arbitray character limit
	{
		"nvim-telescope/telescope.nvim", -- fuzzy file finder
		opts = {
			pickers = {
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!**/.git/*" },
				},
			},
		},
		init = function()
			require("telescope-config")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
		},
		init = function()
			require("nvim-cmp-config")
		end,
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			opts = require("formatter-config").build()
			require("formatter").setup(opts)
		end,
	},
	{
		"sudormrfbin/cheatsheet.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
