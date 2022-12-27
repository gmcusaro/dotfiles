require('catppuccin').setup({
    flavour = 'mocha',
    color_overrides = {
        mocha = {
            green = '#A2CEB4',
            base = '#181824',
            mantle = '#11111b',
            flamingo = '#45475A'
        }
    }
})

vim.cmd.colorscheme('catppuccin')
