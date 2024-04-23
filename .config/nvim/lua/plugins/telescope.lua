return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local telescope = require("telescope")
        local file_browser = require("telescope").extensions.file_browser
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                prompt_prefix = "  ",
                selection_caret = "| ",
                mappings = {
                    n = {
                        ["q"] = actions.close,
                        ["N"] = file_browser.actions.create,
                        ["M"] = file_browser.actions.move,
                        ["D"] = file_browser.actions.remove,
                        ["R"] = file_browser.actions.rename,
                        ["-"] = file_browser.actions.goto_parent_dir,
                    },
                },
                layout_config = {
                    prompt_position = "top",
                },
                sorting_strategy = "ascending",
            },
            extensions = {
                file_browser = {
                    theme = "dropdown",
                    hijack_netrw = true,
                },
                live_grep_args = {
                    auto_quoting = false,
                }
            }
        })

        local opts = { silent = true, noremap = true }
        vim.keymap.set("n", "<leader>ff", function()
            builtin.find_files({
                prompt_title = "Find files",
                previewer = false,
                hidden = true
            })
        end, opts)

        vim.keymap.set("n", "<leader>fb", function()
            file_browser.file_browser({
                prompt_title = "Browser",
                path = "%:p:h",
                previewer = false,
                initial_mode = "normal",
                hidden = true
            })
        end, opts)

        vim.keymap.set("n", "<leader>fo", function()
            builtin.oldfiles({
                prompt_title = "Old files",
                previewer = false,
                initial_mode = "normal"
            })
        end, opts)

        vim.keymap.set("n", "<leader>g", function()
            builtin.live_grep({
                prompt_title = "Live grep",
            })
        end, opts)

        vim.keymap.set("n", "<leader>gg", function()
            builtin.live_grep({
                prompt_title = "Live grep in open files",
                grep_open_files = true,
            })
        end, opts)

        vim.keymap.set("n", "<leader>gf", function()
            builtin.git_files({
                prompt_title = "Git",
                hidden = true,
                previewr = false
            })
        end, opts)
    end,
}
