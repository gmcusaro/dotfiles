return {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    keys = {
        vim.keymap.set("n", "<leader>dd", function()
            if next(require('diffview.lib').views) == nil then
                vim.cmd('DiffviewOpen')
            else
                vim.cmd('DiffviewClose')
            end
        end)
    },
    opts = {
        use_icons = false
    }
}
