local silent = { silent = true, noremap = true }
local keymap = vim.keymap

keymap.set("n", "x", '"_x') -- Do not yank with x
keymap.set("n", "<CR>", ":nohlsearch<CR>", silent)
keymap.set("n", "<leader>a", "ggVG", silent) -- Select all
keymap.set("v", "<BS>", '\"_d', silent) -- Backspace delete visual mode
keymap.set("v", "K", ":m '<-2<CR>gv=gv", silent)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", silent)
keymap.set("n", "<C-s>", ":set scrollbind! scrollbind?<CR>", silent)
keymap.set("n", "U", "<C-r>", silent) -- U for redo

keymap.set("v", "<TAB>", ">gv")
keymap.set("v", "<S-TAB>", "<gv")

-- Navigation - Split - Resize
keymap.set("n", "sh", "<C-w>h", silent)
keymap.set("n", "sj", "<C-w>j", silent)
keymap.set("n", "sk", "<C-w>k", silent)
keymap.set("n", "sl", "<C-w>l", silent)

keymap.set("n", "sv", ":vsplit<CR>", silent)
keymap.set("n", "so", ":split<CR>", silent)
keymap.set("n", "se", "<C-w>=", silent)
keymap.set("n", "sc", ":close<CR>", silent)

keymap.set("n", "<leader>+", ":vertical resize +4<CR>", silent)
keymap.set("n", "<leader>-", ":vertical resize -4<CR>", silent)

-- Buffer
keymap.set("n", "<TAB>", ":bnext<CR>", silent)
keymap.set("n", "<S-TAB>", ":bprevious<CR>", silent)

keymap.set("n", "<leader>b", ":Bdelete hidden<CR>", silent)
keymap.set("n", "<leader>t", ":Bdelete this<CR>", silent)

-- Diffview
keymap.set("n", "<leader>do", "DiffviewOpen<CR>", silent)
keymap.set("n", "<leader>dc", "DiffviewClose<CR>", silent)

-- ZenMode
keymap.set("n", "<leader>z", ":ZenMode<CR>", silent)
