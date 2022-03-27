-- Treesitter
local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

treesitter.setup({
  ensure_installed = {"bash", "lua", "regex", "yaml", "vue", "html", "css", "javascript", "json"},
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
  }
})
