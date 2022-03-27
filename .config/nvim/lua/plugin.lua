vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")

-- Load packer.nvim
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {'rmehri01/onenord.nvim', config = "vim.cmd('colorscheme onenord')"}
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = "BufWinEnter"
  }
  use 'machakann/vim-sandwich'
  use 'tpope/vim-fugitive'
  use 'neovim/nvim-lspconfig'
  use 'tpope/vim-eunuch'
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use {'hoob3rt/lualine.nvim', require = {'kyazdani42/nvim-web-devicons', opt = true}}
  use {'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim'}
  use 'Asheq/close-buffers.vim'
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
  use 'jdhao/better-escape.vim'
  use 'folke/zen-mode.nvim'
  -- Automatically set up your configuration after cloning packer.nvim at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
