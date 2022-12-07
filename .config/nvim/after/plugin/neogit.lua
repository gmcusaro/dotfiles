local neogit = require('neogit')

neogit.setup {
    popup = {
        kind = "split_above",
    },
    commit_popup = {
        kind = "floating"
    },
    -- TODO: check how it works
    integrations = {
        diffview = true
    },
    disable_commit_confirmation = true,
}

local keymap = require('gio.keymaps')
local nnoremap = keymap.nnoremap

local function openCommit()
    neogit.open({ 'commit' })
end

local function openSplit()
    neogit.open({ kind = "split_above" })
end

nnoremap('<leader>gc', openCommit, keymap.opts)
nnoremap('<leader>gs', openSplit, keymap.opts)
nnoremap("<leader>gf", "<cmd>!git fetch --all<CR>", keymap.opts)
