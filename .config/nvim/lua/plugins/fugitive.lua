return {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {
        vim.keymap.set("n", "<leader>gs", function()
            local fugitive_buf_no = vim.fn.bufnr('^fugitive:')
            local buf_win_id = vim.fn.bufwinid(fugitive_buf_no)
            if fugitive_buf_no >= 0 and buf_win_id >= 0 then
                vim.api.nvim_win_close(buf_win_id, false)
            else
                vim.cmd(":Git")
            end
        end, { silent = true, noremap = true }),
        vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { silent = true, noremap = true }),
        vim.keymap.set("n", "<leader>gf", ":Git fetch<CR>", { silent = true, noremap = true }),
        vim.keymap.set("n", "<leader>gr", ":Git rebase<CR>", { silent = true, noremap = true })
    }
}
