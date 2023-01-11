local telescope = require('telescope')
local fb_actions = require('telescope').extensions.file_browser.actions
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup({
    defaults = {
        prompt_prefix = '  ',
        selection_caret = "| ",

        mappings = {
            n = {
                ['q'] = actions.close,
                ['N'] = fb_actions.create,
                ['M'] = fb_actions.move,
                ['D'] = fb_actions.remove,
                ['R'] = fb_actions.rename,
                ['-'] = fb_actions.goto_parent_dir,
            },
            i = {
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous
            }
        },

        layout_config = {
            prompt_position = 'top',
        },

        sorting_strategy = 'ascending',
        extensions = {
            file_browser = {
                theme = 'dropdown',
                hijack_netrw = true,
            },
            live_grep_args = {
                auto_quoting = false,
            }
        }
    }
})

function Old_files()
    local opts = {
        prompt_title = "~ Old files ~",
        previewer = false,
    }
    require("telescope.builtin").oldfiles(opts)
end

function File_browser()
    local opts = {
        prompt_title = "~ Browser ~",
        path = '%:p:h',
        previewer = false,
        initial_mode = 'normal',
        hidden = true
    }
    telescope.extensions.file_browser.file_browser(opts)
end

function Live_grep_selection()
    local utils = require('gio.utils')
    local opts = {
        prompt_title = "~ Live grep ~",
        default_text = utils.current_selection()
    }
    builtin.live_grep(opts)
end

function Live_grep()
    local opts = {
        prompt_title = "~ Live grep ~",
        search = vim.fn.input("Grep > ")
    }
    builtin.grep_string(opts)
end

function Find_files()
    local opts = {
        prompt_title = "~ Find files ~",
        previewer = false,
        hidden = true
    }
    builtin.find_files(opts)
end

function Git_files()
    local opts = {
        prompt_title = "~ Gits ~",
        previewer = false
    }
    builtin.git_files(opts)
end

local keymaps = require("gio.keymaps")
local nnoremap = keymaps.nnoremap
local vnoremap = keymaps.vnoremap

nnoremap('<leader>fo', '<cmd> lua Old_files()<CR>', keymaps.opts)
nnoremap('<leader>fb', '<cmd> lua File_browser()<CR>', keymaps.opts)
nnoremap('<leader>fg', '<cmd> lua Live_grep()<CR>', keymaps.opts)
vnoremap('<leader>fg', '<cmd> lua Live_grep_selection()<CR>', keymaps.opts)
nnoremap('<leader>ff', '<cmd> lua Find_files()<CR>', keymaps.opts)
nnoremap('<leader>gf', '<cmd> lua Git_files()<CR>', keymaps.opts)
