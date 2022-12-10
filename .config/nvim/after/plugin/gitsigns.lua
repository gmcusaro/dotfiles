require('gitsigns').setup({
    signs = {
        add          = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        untracked    = { hl = 'GitSignsAdd', text = '¦', numhl='GitSignsAddNr', linehl='GitSignsAddLn' },
    },
    current_line_blame_formatter = '<summary> | <author_time:%d-%m-%Y> - <author>',
    current_line_blame_opts = {
        virt_text_pos = 'right_align'
    },
})

local keymap = require("gio.keymaps")
local nnoremap = keymap.nnoremap
local signs = package.loaded.gitsigns

nnoremap('<leader>gi', signs.toggle_current_line_blame, keymap.opts)
