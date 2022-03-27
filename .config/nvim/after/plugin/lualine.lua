require('lualine').setup{
  options = {
    theme = 'onenord',
    section_separators = { left = '', right = '' },
    component_separators = ''
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_x = { 'filetype', 'encoding' },
    lualine_y = { }
  }
}
