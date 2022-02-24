-- Plugins
require('packer').startup(function(use)
-- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-fugitive'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-surround'

  use 'EdenEast/nightfox.nvim'

  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use {
    'hoob3rt/lualine.nvim',
    require = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'Asheq/close-buffers.vim'
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }

  use {
    'jdhao/better-escape.vim',
    event = 'InsertEnter'
  }

  use {
    'plasticboy/vim-markdown',
    ft = { "markdown" }
  }

  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }
end)
