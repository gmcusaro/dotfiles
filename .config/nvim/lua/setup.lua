-- Setup

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

-- Telescope
local actions = require'telescope.actions'

require'telescope'.setup {
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    prompt_prefix = " >",
    color_devicons = true,

    previewer = true,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_better,
        ["<C-k>"] = actions.move_selection_worse,
        ["<Esc>"] = actions.close
      }
    }
  }
}

-- Kommentary
require('kommentary.config').configure_language("default", {
  prefer_single_line_comments = true,
  use_consistent_indentation = true,
  ignore_whitespace = true
})
