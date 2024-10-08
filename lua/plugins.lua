-- vim:fileencoding=utf-8:foldmethod=marker

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
	--: Behaviour {{{
	{
		"VonHeikemen/lsp-zero.nvim",
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		--[[ init = function()
           require("nvim-tree-config")
		end,]]
		opts = {
			hijack_directories = {
				enable = false,
				auto_open = false,
			},
			renderer = {
				highlight_modified = "name",
			},
			modified = {
				enable = true,
			},
			diagnostics = {
				enable = true,
			},
			--update_focused_file = { enable = true },
			filters = {
				dotfiles = false,
				git_ignored = false,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"json",
				"javascript",
				"typescript",
				"json5",
				"jsonc",
				"xml",
				"html",
				"zig",
				"rust",
				"qmljs",
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"neovim/nvim-lspconfig", -- Configurations for Nvim LSP
		init = function()
			require("nvim-lsp-config")
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		opts = {},
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
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		opts = { indent = { char = "│" } },
	},
	{ -- fuzzy file finder
		"nvim-telescope/telescope.nvim",
		opts = {
			pickers = {
				find_files = {
					--hidden = true,
					no_ignore = true,
				},
			},
		},
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		opts = {
			extensions = {
				file_browser = {
					theme = "ivy",
					hijack_netrw = true,
					auto_depth = true,
					no_ignore = false,
					hidden = { file_browser = true, folder_browser = true },
				},
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("file_browser")
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
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
		},
		init = function()
			require("nvim-cmp-config")
		end,
	},
	{
		"FabijanZulj/blame.nvim",
		opts = {
			virtual_style = "right",
			merge_consecutive = true,
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			auto_close = true,
			modes = {
				diagnostics = {
					auto_open = false,
				},
			},

			win = { position = "right" },
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
		config = function(_, opts)
			require("which-key-config")
			require("which-key").setup(opts)
		end,
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			local opts = require("formatter-config").build()

			require("formatter").setup(opts)
		end,
	},

	{
		"direnv/direnv.vim",
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = {
			change_to_vcs_root = true,
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
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

	--:}}}
	--: Visuals {{{
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = { options = { globalstatus = true } },
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
	{
		-- thin bar indicating an arbitray character limit
		"lukas-reineke/virt-column.nvim",
		opts = {
			virtcolumn = "120,100,80",
			char = "│",
			exclude = {
				buftypes = {},
			},
		},
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			render = "wrapped-compact",
			max_width = function()
				return math.floor(vim.o.columns * 0.5)
			end,
		},
		config = function(_, opts)
			require("notify").setup(opts)
			vim.notify = require("notify")
		end,
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
		"stevearc/dressing.nvim",
	},
	--:}}}
})

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
})

vim.cmd("colorscheme catppuccin")

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function(data)
		if vim.fn.isdirectory(data.file) == 1 then
			require("telescope").extensions.file_browser.file_browser()
		end
	end,
})
