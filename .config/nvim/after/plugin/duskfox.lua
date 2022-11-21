-- require("rose-pine").setup({
--     disable_background = true,
-- })

local palette =  {
    duskfox = {
        bg1 =  "#03020d"
    }
}

require("nightfox").setup({
    palettes = palette
})

vim.cmd("colorscheme duskfox")
