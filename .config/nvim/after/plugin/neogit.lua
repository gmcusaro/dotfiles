local neogit = require('neogit')

neogit.setup {
    commit_popup = {
        kind = "split_above"
    },
    integrations = {
        diffview = true
    },
    disable_commit_confirmation = true,
}

local function opencommit()
    neogit.open({ 'commit' })
end

local function opensplit()
    neogit.open({ kind = "split_above" })
end

local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<leader>gc", opencommit, opts)
-- nnoremap('<leader>gc', opencommit, keymap.opts)

vim.keymap.set("n", "<leader>gs", opensplit, opts)
-- nnoremap('<leader>gs', opensplit, keymap.opts)

vim.keymap.set("n", "<leader>gf", "<cmd>!git fetch --all<CR>", opts)
-- nnoremap("<leader>gf", "<cmd>!git fetch --all<cr>", keymap.opts)
