return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = 'mocha',
                -- transparent_background = true,
                color_overrides = {
                    mocha = {
                        base = '#1e2030',
                        mantle = '#181824',
                        green = '#A2CEB4',
                        flamingo = '#77798C'
                    }
                },
            })

            vim.cmd.colorscheme "catppuccin"
            vim.cmd.hi 'Comment gui=none'
        end
    },
}
