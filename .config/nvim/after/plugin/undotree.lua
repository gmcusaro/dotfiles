local undotree = require('undotree')

undotree.setup({
    float_diff = false
})

local keymaps = require("gio.keymaps")
local nnoremap = keymaps.nnoremap

nnoremap('<leader>u', undotree.toggle, keymaps.opts)
