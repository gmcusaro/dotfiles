return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "markdown",
                "markdown_inline",
                "lua",
                "rust",
                "html",
                "typescript",
                "tsx",
                "astro",
                "css",
                "javascript",
                "json",
                "yaml",
                "toml",
                "vim",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true }
        })
    end
}
