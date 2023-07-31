local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require('lazy').setup({
    { "nvim-lua/plenary.nvim" },

    { "catppuccin/nvim", name = "catppuccin" },
    { "NeogitOrg/neogit" },
    { "lewis6991/gitsigns.nvim" },
    { "sindrets/diffview.nvim" },
    { "jiaoshijie/undotree" },

    { "nvim-treesitter/nvim-treesitter", build = { ":TSUpdate" } },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-live-grep-args.nvim" },

    { "nvim-lualine/lualine.nvim",
        dependencies = {
            "meuter/lualine-so-fancy.nvim",
        }
    },
    { "ur4ltz/surround.nvim" },
    { "numToStr/Comment.nvim" },
    { "folke/zen-mode.nvim" },
    { "windwp/nvim-ts-autotag" },
    { "windwp/nvim-autopairs" },
    { "Asheq/close-buffers.vim" },
    { "jdhao/better-escape.vim", event = { "InsertEnter" } },

    { "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" }
    },

    { 'echasnovski/mini.jump',
        version = '*',
        init = function ()
            require('mini.jump').setup()
        end
    },

    {   "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            {"neovim/nvim-lspconfig"},
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},

            -- Autocompletion
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"saadparwaiz1/cmp_luasnip"},
            {"hrsh7th/cmp-nvim-lua"},

            -- Snippets
            {"L3MON4D3/LuaSnip"},
        }
    }
})
