local opts = { silent = true, noremap = true }
return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
        signs = {
            add = { text = "+" },
            change = { text = "|" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = "¦" }
        },
        current_line_blame_formatter = '<summary> | <author_time:%d-%m-%Y> - <author>',
        current_line_blame_opts = {
            virt_text_pos = 'right_align'
        },
    },
    keys = {
        vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", opts),
        vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk_inline<CR>", opts)
    }
}
