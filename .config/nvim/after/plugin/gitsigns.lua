------ Gitsigns
local ok, signs = pcall(require, "gitsigns")
if not ok then
  return
end

signs.setup {
  current_line_blame = false,
  current_line_blame_formatter = '<summary> - <author>, <author_time:%d-%m-%Y>',
  current_line_blame_opts = {
    virt_text_pos = 'eol',
    delay = 500
  },
  signcolumn = false,
  numhl = true,
  linehl = true,
  word_diff = true,
}
