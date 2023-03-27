local undotree = require('undotree')

undotree.setup({
    float_diff = false
})

vim.keymap.set("n", "<leader>u", undotree.toggle, { silent = true, noremap = true })
