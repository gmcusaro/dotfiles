-- Lualine
local ok, lualine = pcall(require, 'lualine')
if not ok then
  return
end

lualine.setup{
  options = {
    theme = 'nightfox',
    section_separators = {'', ''}
  },
  sections = {
    lualine_x = {'encoding', 'filetype'},
  }
}
