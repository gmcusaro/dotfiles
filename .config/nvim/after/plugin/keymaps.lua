local remap = require('gio.keymaps')

local nnoremap = remap.nnoremap
local vnoremap = remap.vnoremap
-- local inoremap = Remap.inoremap
-- local xnoremap = Remap.xnoremap
-- local nmap     = Remap.nmap

nnoremap('x', '"_x') -- Do not yank with x

-- Clear highlight search
nnoremap("<CR>", ":nohlsearch<CR>", remap.opts)
vnoremap("<CR>", ":nohlsearch<CR>", remap.opts)-- <leader>nh

nnoremap('<leader>a', 'gg<S-v>G') -- Select all

vnoremap('<BS>', '\"_d') -- Backspace delete visual mode
vnoremap('K', ":m '<-2<CR>gv=gv", remap.opts) -- Move UP
vnoremap('J', ":m '>+1<CR>gv=gv", remap.opts) -- Move DOWN

-- Navigation - Split - Resize
nnoremap('sh', '<C-w>h')
nnoremap('sj', '<C-w>j')
nnoremap('sk', '<C-w>k')
nnoremap('sl', '<C-w>l')

nnoremap('<leader>v', ':vsplit<CR>', remap.opts)
nnoremap('<leader>h', ':split<CR>', remap.opts)
nnoremap('<leader>+', ':vertical resize +5<CR>', remap.opts)
nnoremap('<leader>-', ':vertical resize -5<CR>', remap.opts)

nnoremap('<C-s>', ':set scrollbind!  scrollbind?<CR>', remap.opts)

-- Tab navigation
nnoremap('<TAB>', ':bnext<CR>', remap.opts)
nnoremap('<S-TAB>', ':bprevious<CR>', remap.opts)

-- Buffer delete
nnoremap('<leader>b', ':Bdelete menu<CR>', remap.opts)
nnoremap('<leader>t', ':Bdelete this<CR>', remap.opts)

-- Diffview
nnoremap('<leader>do', ':DiffviewOpen<CR>', remap.opts)
nnoremap('<leader>dc', ':DiffviewClose<CR>', remap.opts)
