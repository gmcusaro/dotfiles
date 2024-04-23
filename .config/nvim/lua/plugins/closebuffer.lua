return {
    "Asheq/close-buffers.vim",
    lazy = false,
    keys = {
        vim.keymap.set("n", "<leader>b", ":Bdelete hidden<CR>", { silent = true }),
        vim.keymap.set("n", "<leader>t", ":Bdelete this<CR>", { silent = true })
    }
}
