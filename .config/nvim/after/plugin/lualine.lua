-- Lualine
local ok, lualine = pcall(require, 'lualine')
if not ok then
  return
end

-- Require Gitsign
local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

lualine.setup{
  options = {
    theme = 'nightfox',
    section_separators = { left = '', right = '' },
    component_separators = ''
  },
  sections = {
    lualine_a = { 'mode', {'diff', source = diff_source} },
    lualine_x = { 'filetype', 'encoding' },
    lualine_y = { }
  }
}
