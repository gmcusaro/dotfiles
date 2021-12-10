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

end)
