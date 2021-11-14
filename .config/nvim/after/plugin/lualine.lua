-- Lualine
require'lualine'.setup{
  options = {
    theme = 'iceberg',
    section_separators = {'', ''}
  },
  sections = {
    lualine_x = {'encoding', 'filetype'}
  }
}
