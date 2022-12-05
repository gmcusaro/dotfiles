local telescope = require('telescope')
local actions = require('telescope.actions')
local fb_actions = require('telescope').extensions.file_browser.actions

telescope.setup({
    defaults = {
        prompt_prefix = '  ',
        selection_caret = "* ",

        -- file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        -- grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        -- qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            n = {
                ['q'] = actions.close,
                ['o'] = fb_actions.open,
                ['N'] = fb_actions.create,
                ['M'] = fb_actions.move,
                ['D'] = fb_actions.remove,
                ['R'] = fb_actions.rename,
                ['-'] = fb_actions.goto_parent_dir,
            },
            i = {
                ['jk'] = actions.close,
                ['<Tab>'] = actions.move_selection_next,
                ["<S-Tab>"] = actions.move_selection_previous,
            },
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
    local current_selection = require('gio.utils').current_selection
    local opts = {
        prompt_title = "~ Live grep ~",
        previewer = false,
        default_text = current_selection()
    }
    require("telescope.builtin").live_grep(opts)
end

function Live_grep()
    local opts = {
        prompt_title = "~ Live grep ~",
        previewer = false,
        default_text = ""
    }
    require("telescope.builtin").live_grep(opts)
end

function Find_files()
    local opts = {
        prompt_title = "~ Find files ~",
        previewer = false,
        hidden = true
    }
    require("telescope.builtin").find_files(opts)
end

local nnoremap = require("gio.keymaps").nnoremap
local vnoremap = require("gio.keymaps").vnoremap

nnoremap("<leader>f", ":Telescope<CR>", { silent = true })
nnoremap('fo', '<cmd> lua Old_files()<CR>', { silent = true })
nnoremap('fb', '<cmd> lua File_browser()<CR>', { silent = true })
nnoremap('fg', '<cmd> lua Live_grep()<CR>', { silent = true })
vnoremap('fg', '<cmd> lua Live_grep_selection()<CR>', { silent = true })
nnoremap('ff', '<cmd> lua Find_files()<CR>', { silent = true })
