local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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

    use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}

    use 'nvim-treesitter/nvim-treesitter'

    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use 'preservim/nerdcommenter'

    use "lukas-reineke/indent-blankline.nvim"

    use "EdenEast/nightfox.nvim"

    -- Autocompletion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-buffer'

    vim.cmd([[
        augroup packer_user_config
            autocmd!
            autocmd BufWritePost plugins.lua source <afile> | PackerCompile
        augroup end
    ]])

    
    -- setup section
    require('nightfox-config')
    require('nvim-tree-config')

    if packer_bootstrap then
        require('packer').sync()
    end
end)
