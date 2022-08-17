require'nvim-treesitter.configs'.setup {
    -- sync_install = false,
    -- auto_install = false,
    -- ignore_install = { "" },
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
        -- additional_vim_regex_highlighting = false,
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
