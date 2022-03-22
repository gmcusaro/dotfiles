-- Onenord
local ok, onenord = pcall(require, 'onenord')
if not ok then
  return
end

onenord.setup {
  borders = false,
  styles = {
    comments = 'italic',
  },
  disable = {
    background = false,
  },
  custom_colors = {
    bg = '#060519',
    gray = '#060519',
  }
}
