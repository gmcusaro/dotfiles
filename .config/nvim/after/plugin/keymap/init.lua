local Remap = require('gio.keymaps')
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
-- local inoremap = Remap.inoremap
-- local xnoremap = Remap.xnoremap
-- local nmap     = Remap.nmap

local silent = { silent = true }

nnoremap('x', '"_x') -- Do not yank with x
nnoremap('<leader>a', 'gg<S-v>G') -- Select all

vnoremap('<BS>', '\"_d') -- Backspace delete visual mode
vnoremap('K', ":m '<-2<CR>gv=gv", silent) -- Move UP
vnoremap('J', ":m '>+1<CR>gv=gv", silent) -- Move DOWN

nnoremap('Q', ':noh<CR>', silent)

-- Navigation - Split - Resize
nnoremap('sh', '<C-w>h')
nnoremap('sj', '<C-w>j')
nnoremap('sk', '<C-w>k')
nnoremap('sl', '<C-w>l')

nnoremap('<leader>v', ':vsplit<CR>', silent)
nnoremap('<leader>h', ':split<CR>', silent)
nnoremap('<leader>+', ':vertical resize +5<CR>', silent)
nnoremap('<leader>-', ':vertical resize -5<CR>', silent)

-- Tab navigation
nnoremap('<TAB>',   ':bnext<CR>', silent)
nnoremap('<S-TAB>', ':bprevious<CR>', silent)

-- Buffer delete
nnoremap('<leader>b', ':Bdelete menu<CR>', silent)
nnoremap('<leader>t', ':Bdelete this<CR>', silent)
