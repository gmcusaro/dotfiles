local neogit = require('neogit')

neogit.setup {
    -- popup = {
    --     kind = "split_above",
    -- },
    commit_popup = {
        kind = "split_above"
    },
    integrations = {
        diffview = true
    },
    disable_commit_confirmation = true,
}

local keymap = require('gio.keymaps')
local nnoremap = keymap.nnoremap

local function opencommit()
    neogit.open({ 'commit' })
end

local function opensplit()
    neogit.open({ kind = "split_above" })
end

nnoremap('<leader>gc', opencommit, keymap.opts)
nnoremap('<leader>gs', opensplit, keymap.opts)
nnoremap("<leader>gf", "<cmd>!git fetch --all<cr>", keymap.opts)
