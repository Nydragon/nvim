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
			update_focused_file = { enable = true },
			filters = {
				dotfiles = false,
				git_ignored = false,
			},
		},
	},
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
			"lewis6991/gitsigns.nvim",
		},
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		enabled = true,
		opts = {
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
		},
	},
	{
		"neovim/nvim-lspconfig", -- Configurations for Nvim LSP
		init = function()
			require("nvim-lsp-config")
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		opts = {
			on_attach = function(_, bufnr)
				-- Hover actions
				vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
				-- Code action groups
				vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
			end,
		},
	},
	{
		"axieax/urlview.nvim",
		opts = {
			default_picker = "telescope",
			default_action = "system",
		},
	},
	"preservim/nerdcommenter", -- (batch)commenting tool
	{
		"m4xshen/autoclose.nvim",
		opts = require("autoclose-config"),
	},
	"lukas-reineke/indent-blankline.nvim",
	{
		"EdenEast/nightfox.nvim", -- themeing
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
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{ "lukas-reineke/virt-column.nvim", opts = { virtcolumn = "120" } }, -- thin bar indicating an arbitray character limit

	{
		"nvim-telescope/telescope.nvim", -- fuzzy file finder
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
		},
		init = function()
			require("nvim-cmp-config")
		end,
	},
	{
		"mhartington/formatter.nvim",
		--opts = require("formatter-config").build(),
		config = function()
			local opts = require("formatter-config").build()

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
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			direction = "float",
		},
		config = function(_, opts)
			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

			function _Lazygit_toggle()
				lazygit:toggle()
			end

			require("toggleterm").setup(opts)
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = { options = { globalstatus = true } },
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			position = "right",
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"b0o/incline.nvim",
		config = function()
			require("incline").setup()
			require("incline-config")
		end,
		-- Optional: Lazy load Incline
		event = "VeryLazy",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		config = function(_, opts)
			require("which-key-config")
			require("which-key").setup(opts)
		end,
	},
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.cmd("colorscheme catppuccin")

--vim.api.nvim_create_autocmd({ "VimLeave" }, {
--callback = function()
--vim.cmd("close")
--end,
--})
