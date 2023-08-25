local neogit = require('neogit')

neogit.setup {
    integrations = {
        diffview = true
    },
    -- disable_hint = true,
    disable_commit_confirmation = true,
    kind = "split"
}

local opts = { silent = true, noremap = true }
local function opensplit()
    neogit.open({ kind = "split" })
end

vim.keymap.set("n", "<leader>gs", opensplit, opts)
vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>", opts)
vim.keymap.set("n", "<leader>gf", "<cmd>!git fetch --all<CR>", opts)
