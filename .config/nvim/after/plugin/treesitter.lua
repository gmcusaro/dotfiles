require("nvim-treesitter.configs").setup {
    sync_install = true,
    auto_install = true,
    ensure_installed = {
        "lua",
        "rust",
        "css",
        "javascript",
        "html",
        "markdown",
        "markdown_inline",
        "json",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" }
    },
    indent =  {
        enable = true
    },
    incremental_selection = {
        enable = true
    },
    autotag = {
        enable = true
    }
}
