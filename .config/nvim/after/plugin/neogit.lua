local neogit = require('neogit')

neogit.setup {}

local nnoremap = require('gio.keymaps').nnoremap

nnoremap('<leader>gs', function()
    neogit.open({ kind = 'split_above' })
end)
