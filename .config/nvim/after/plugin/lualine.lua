-- Lualine
require'lualine'.setup{
  options = {
    theme = 'iceberg_dark',
    section_separators = {'', ''}
  },
  sections = {
    lualine_x = {'encoding', 'filetype'}
  }
}
