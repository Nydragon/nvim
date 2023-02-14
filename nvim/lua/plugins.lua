local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'

        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            }
        }

        use {
            'nvim-lualine/lualine.nvim',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            }

        }

        use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }

        use 'nvim-treesitter/nvim-treesitter'

        use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

        -- (batch)commenting tool
        use 'preservim/nerdcommenter'

        use "lukas-reineke/indent-blankline.nvim"

        -- themeing
        use "EdenEast/nightfox.nvim"

        -- thin bar indicating an arbitray character limit
        use "lukas-reineke/virt-column.nvim"

        -- fuzzy file finder
        use 'nvim-telescope/telescope.nvim'

        -- autocompletion engine, plugs into lsp
        use {
            "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-cmdline",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lua",
            }
        }

        -- renders images in nvim
        use {
            'samodostal/image.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
                'm00qek/baleia.nvim'
            },
        }

        use {
            'mrcjkb/haskell-tools.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope.nvim'
            },
            branch = '1.x.x',
        }

        use 'dense-analysis/ale'

        vim.cmd([[
        augroup packer_user_config
            autocmd!
            autocmd BufWritePost plugins.lua source <afile> | PackerCompile
        augroup end
        ]])

        -- init configs
        require('nightfox-config')
        require('nvim-lsp-config')
        require('nvim-tree-config')
        require('nvim-cmp-config')
        require('image-config')
        require('haskell-config')
        require('telescope-config')
        require('lualine').setup()
        require("virt-column").setup()


        vim.g.ale_linters = { haskell =  {'hlint', 'hdevtools', 'hfmt'} }

        if packer_bootstrap then
            require('packer').sync()
        end
    end)
