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

local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<leader>ff", Find_files, opts)
vim.keymap.set("n", "<leader>fo", Old_files, opts)
vim.keymap.set("n", "<leader>fb", File_browser, opts)

vim.keymap.set("n", "<leader>fg", Live_grep, opts)
vim.keymap.set("v", "<leader>fg", Live_grep_selection, opts)

vim.keymap.set("n", "<leader>gf", Git_files, opts)
