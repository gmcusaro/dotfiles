local Remap = require("gio.keymaps")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
-- local inoremap = Remap.inoremap
-- local xnoremap = Remap.xnoremap
-- local nmap     = Remap.nmap

nnoremap('x', '"_x') -- Do not yank with x
vnoremap("<BS>", "\"_d") -- Backspace delete visual mode
nnoremap('<leader>a', 'gg<S-v>G') -- Select all

-- Navigation - Split - Resize
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

-- Buffer delete
nnoremap("<leader>b", ":Bdelete menu<CR>")
nnoremap("<leader>t", ":Bdelete this<CR>")
