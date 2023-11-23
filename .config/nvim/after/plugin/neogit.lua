local neogit = require('neogit')

neogit.setup {
    integrations = {
        diffview = true
    },
    disable_commit_confirmation = true,
    auto_show_console = false,
    kind = "split",
    commit_editor = {
        kind = "split",
    },
}

local opts = { silent = true, noremap = true }
vim.keymap.set("n", "<leader>gs", neogit.open, opts)
vim.keymap.set("n", "<leader>gf", "<cmd>!git fetch --all<CR>", opts)
