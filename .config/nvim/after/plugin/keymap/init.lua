local Remap = require("gio.keymaps")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap     = Remap.nmap

nnoremap("<leader>e", ":Ex<CR>")
-- nnoremap("<leader>e", ":Lexplore<CR>")

-- Do not yank with x
nnoremap('x', '"_x')

-- Backspace delete visual mode
vnoremap("<BS>", "\"_d")

-- Select all
nnoremap('<leader>a', 'gg<S-v>G')

-- Split navigation
nnoremap("sh", "<C-w>h")
nnoremap("sj", "<C-w>j")
nnoremap("sk", "<C-w>k")
nnoremap("sl", "<C-w>l")

nnoremap("<leader>v", ":vsplit<CR>", { silent = true })
nnoremap("<leader>h", ":split<CR>", { silent = true })
nnoremap("<leader>+", ":vertical resize +5<CR>", { silent = true })
nnoremap("<leader>-", ":vertical resize -5<CR>", { silent = true })

-- Tab navigation
nnoremap("<TAB>",   ":bnext<CR>")
nnoremap("<S-TAB>", ":bprevious<CR>")

-- Telescope
nnoremap("ff", ":Telescope<CR>", { silent = true })
nnoremap("fo", ":Telescope oldfiles<CR>", { silent = true })
nnoremap("fb", ":Telescope buffers<CR>", { silent = true })
nnoremap("<leader>f", ":Telescope find_files<CR>", { silent = true })

-- Bugger delete
nnoremap("<leader>b", ":Bdelete menu<CR>")
nnoremap("<leader>t", ":Bdelete this<CR>")
