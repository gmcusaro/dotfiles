local undotree = require('undotree')

undotree.setup({
    float_diff = false
})

local opts = { silent = true, noremap = true }
vim.keymap.set("n", "<leader>u", undotree.toggle, opts)
