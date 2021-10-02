-- Plugins

require('packer').startup(function(use)
-- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-fugitive'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-surround'

  use 'cocopon/iceberg.vim'

  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup {} end
  }

  use 'Pocco81/TrueZen.nvim'

  use 'b3nj5m1n/kommentary'

  use {
    'hoob3rt/lualine.nvim',
    require = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'voldikss/vim-floaterm'
  }

end)
