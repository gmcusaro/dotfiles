return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
       require("oil").setup {
            column = { "icon" },
            view_options = {
                show_hidden = true,
            }
        }

        -- Open parent directory in current window
        vim.keymap.set("n", "-", "<cmd>Oil<CR>")

        -- Open parent directory in floating window
        vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
    end
}
