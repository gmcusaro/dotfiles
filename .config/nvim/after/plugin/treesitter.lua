-- Treesitter
require('nvim-treesitter.configs').setup({
  ensure_installed = {"bash", "lua", "regex", "yaml", "vue", "html", "css", "javascript", "json"},
  ignore_install = {},
  highlight = {
    enable = false,
    disable = {},
  },
})

