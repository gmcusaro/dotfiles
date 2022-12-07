require('catppuccin').setup({
    flavour = 'mocha',
    color_overrides = {
        mocha = {
            base = '#03020d',
            green = '#BBD3A0'
        }
    }
})

vim.cmd("colorscheme catppuccin")
