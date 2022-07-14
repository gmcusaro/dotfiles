local Remap = require("gio.keymaps")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap     = Remap.nmap

nnoremap("<leader>e", ":Ex<CR>")

-- Backspace delete visual mode
vnoremap("<BS>", "\"_d")

-- nnoremap("<leader>y", "\"+y")
-- vnoremap("<leader>y", "\"+y")
-- nmap("<leader>Y", "\"+Y")

-- Split navigation
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

nnoremap("<leader>v", ":vsplit<CR>")
nnoremap("<leader>h", ":split<CR>")
nnoremap("<leader>+", ":vertical resize +5<CR>")
nnoremap("<leader>-", ":vertical resize -5<CR>")

-- Tab navigation
nnoremap("<TAB>",   ":bnext<CR>")
nnoremap("<S-TAB>", "bprevious<CR>")

-- Telescope
nnoremap("ff", ":Telescope<CR>")
nnoremap("fo", ":Telescope oldfiles<CR>")
nnoremap("fb", ":Telescope buffers<CR>")
nnoremap("<leader>f", ":Telescope find_files<CR>")

-- Bugger delete
nnoremap("<leader>b", ":Bdelete menu<CR>")
nnoremap("<leader>t", ":Bdelete this<CR>")
