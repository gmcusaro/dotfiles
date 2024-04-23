return {
    "szw/vim-maximizer",
    lazy = false,
    keys = {
        vim.keymap.set("n", "<leader>mm", "<cmd>MaximizerToggle<CR>", { silent = true, noremap = true })
    }
}
