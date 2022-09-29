local neogit = require('neogit')

neogit.setup {
    popup = {
        kind = "split_above",
    },
    commit_popup = {
        kind = "floating"
    },
    -- TODO: see how it works
    integrations = {
        diffview = true
    },
    disable_commit_confirmation = true,
}

local nnoremap = require('gio.keymaps').nnoremap

nnoremap('<leader>gc', function()
    neogit.open({ 'commit' })
end, { silent = true })

nnoremap('<leader>gs', function()
    neogit.open({ kind = "split_above" })
end, { silent = true })

nnoremap("<leader>gf", "<cmd>!git fetch --all<CR>", { silent = true });
