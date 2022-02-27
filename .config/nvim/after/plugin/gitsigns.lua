---- Gitsigns
require('gitsigns').setup {
	current_line_blame = false,
	current_line_blame_opts = {
		virt_text_pos = 'right_align',
    delay = 500
	},
  current_line_blame_formatter = '<summary> - <author>, <author_time:%d-%m-%Y>',
}
