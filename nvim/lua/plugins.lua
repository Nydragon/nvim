local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})

	use({ "romgrk/barbar.nvim", requires = "nvim-web-devicons" })

	use("nvim-treesitter/nvim-treesitter")

	use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP
	use("simrat39/rust-tools.nvim")

	-- (batch)commenting tool
	use("preservim/nerdcommenter")
	use("m4xshen/autoclose.nvim")
	use("lukas-reineke/indent-blankline.nvim")

	-- themeing
	use("EdenEast/nightfox.nvim")

	-- thin bar indicating an arbitray character limit
	use("lukas-reineke/virt-column.nvim")

	-- fuzzy file finder
	use("nvim-telescope/telescope.nvim")

	-- autocompletion engine, plugs into lsp
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
		},
	})

	--use 'dense-analysis/ale'
	use("mhartington/formatter.nvim")

	use({
		"sudormrfbin/cheatsheet.nvim",

		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	})

	vim.cmd([[
        augroup packer_user_config
            autocmd!
            autocmd BufWritePost plugins.lua source <afile> | PackerCompile
        augroup end
        ]])

	-- init configs
	require("nightfox-config")
	require("nvim-lsp-config")
	require("nvim-tree-config")
	require("nvim-cmp-config")
	require("autoclose-config")
	require("image-config")
	require("telescope-config")
	-- require('ale-config')
	require("formatter-config")
	require("lualine").setup()
	require("virt-column").setup()

	if packer_bootstrap then
		require("packer").sync()
	end
end)
