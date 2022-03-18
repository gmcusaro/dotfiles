-- Lualine
local ok, lualine = pcall(require, 'lualine')
if not ok then
  return
end

lualine.setup{
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
