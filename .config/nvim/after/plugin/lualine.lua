-- Lualine
require'lualine'.setup{
  options = {
    theme = 'nightfox',
    section_separators = {'', ''}
  },
  sections = {
    lualine_x = {'encoding', 'filetype'},
  }
}
