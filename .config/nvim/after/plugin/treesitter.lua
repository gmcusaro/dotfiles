require'nvim-treesitter.configs'.setup {
    sync_install = true,
    auto_install = true,
    ignore_install = {},
    ensure_installed = {
        'c',
        'lua',
        'rust',
        'css',
        'javascript',
        'html',
        'markdown',
        'json',
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
        disable = {}
    },
    indent =  {
        enable = true,
        disable = {}
    },
    autotag = {
        enable = true
    }
}
