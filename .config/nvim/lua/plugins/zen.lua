return  {
    "folke/zen-mode.nvim",
    opts = {
        window = {
            width = .80,
            height = 0.9,
            backdrop = 1,
            options = {
                cursorline = false
            }
        }
    },
    keys = {
        vim.keymap.set("n", "<leader>z", ":ZenMode<CR>")
    }
}
