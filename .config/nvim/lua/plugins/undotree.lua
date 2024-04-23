return {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    lazy = false,
    keys = {
        vim.keymap.set("n", "<leader>u", "<cmd>lua require('undotree').toggle()<cr>")
    },
    opts = {
        float_diff = false,
        position = "bottom"
    }
}
