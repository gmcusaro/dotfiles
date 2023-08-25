require('gitsigns').setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "¦" }
        -- add          = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        -- untracked    = { hl = 'GitSignsAdd', text = '¦', numhl='GitSignsAddNr', linehl='GitSignsAddLn' },
    },
    current_line_blame_formatter = '<summary> | <author_time:%d-%m-%Y> - <author>',
    current_line_blame_opts = {
        virt_text_pos = 'right_align'
    },
})


local signs = package.loaded.gitsigns
local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<leader>gi", signs.toggle_current_line_blame, opts)
