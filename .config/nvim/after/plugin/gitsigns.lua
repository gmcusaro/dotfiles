require('gitsigns').setup({
	signs = {
		add          = { hl = "GitSignsAdd",    text = "┃", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change       = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete       = { hl = "GitSignsDelete", text = "━", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete    = { hl = "GitSignsDelete", text = "━", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "~ ", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
	},
    current_line_blame_formatter = '<summary> | <author_time:%d-%m-%Y> - <author>',
    current_line_blame_opts = {
        virt_text_pos = 'right_align'
    }
})

local nnoremap = require("gio.keymaps").nnoremap
local gs = package.loaded.gitsigns

nnoremap('gsb', gs.toggle_current_line_blame)
