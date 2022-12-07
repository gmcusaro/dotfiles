require('gitsigns').setup({
    signs = {
        add          = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" }, --┃
    --     change       = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    --     delete       = { hl = "GitSignsDelete", text = "━", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    --     topdelete    = { hl = "GitSignsDelete", text = "━", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    --     changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
    current_line_blame_formatter = '<summary> | <author_time:%d-%m-%Y> - <author>',
    current_line_blame_opts = {
        virt_text_pos = 'right_align'
    },
    -- TODO check options
    -- preview_config = {
    --     -- Options passed to nvim_open_win
    --     border = 'double',
    --     -- style = 'minimal',
    --     -- relative = 'cursor',
    --     row = 3,
    --     col = 3
    -- },
})

local keymap = require("gio.keymaps")
local nnoremap = keymap.nnoremap
local signs = package.loaded.gitsigns

nnoremap('<leader>gi', signs.toggle_current_line_blame, keymap.opts)
