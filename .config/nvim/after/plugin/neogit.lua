local neogit = require('neogit')
local nnoremap = require('gio.keymaps').nnoremap

neogit.setup {}

nnoremap('<leader>gs', function()
    neogit.open({ kind = 'split_above' })
end);
