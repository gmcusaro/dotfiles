local neogit = require('neogit')

neogit.setup {
    integrations = {
        diffview = true
    },
    disable_commit_confirmation = true,
}

local opts = { silent = true, noremap = true }

local function opencommit()
    neogit.open({ 'commit' })
end

local function opensplit()
    neogit.open({ kind = "split" })
end

vim.keymap.set("n", "<leader>gc", opencommit, opts)
vim.keymap.set("n", "<leader>gs", opensplit, opts)
vim.keymap.set("n", "<leader>gf", "<cmd>!git fetch --all<CR>", opts)
