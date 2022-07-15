local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        tag = 'v1.*',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    }

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }

    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    use {'hoob3rt/lualine.nvim', require = {'kyazdani42/nvim-web-devicons', opt = true}}
    use 'ur4ltz/surround.nvim'

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use {'jdhao/better-escape.vim', event = 'InsertEnter'}

    use 'Asheq/close-buffers.vim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
