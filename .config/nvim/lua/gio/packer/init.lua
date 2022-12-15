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

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use { 'nvim-lua/plenary.nvim' } -- Common Utilities

    use { 'catppuccin/nvim', as = 'catppuccin' }

    use { 'TimUntersberger/neogit', requires = {
        'sindrets/diffview.nvim'
    } }
    use { 'lewis6991/gitsigns.nvim' }
    use { 'jiaoshijie/undotree' }

    use { 'kyazdani42/nvim-web-devicons' }
    use { 'nvim-lualine/lualine.nvim' }

    use { 'nvim-treesitter/nvim-treesitter', run = { ':TSUpdate' } }
    use { 'nvim-telescope/telescope.nvim' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }
    use { 'nvim-telescope/telescope-live-grep-args.nvim' }

    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'

    use 'ur4ltz/surround.nvim'
    use { 'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'windwp/nvim-ts-autotag'
    use 'windwp/nvim-autopairs'
    use { 'jdhao/better-escape.vim', event = { 'InsertEnter' } }
    use 'Asheq/close-buffers.vim'

    -- for fun
    use 'namjul/dendron.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
