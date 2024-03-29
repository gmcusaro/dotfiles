local silent = { silent = true, noremap = true }

vim.keymap.set("n", "x", '"_x', silent) -- Do not yank with x
vim.keymap.set("n", "<CR>", ":nohlsearch<CR>", silent) -- Clear highlight search
vim.keymap.set("n", "<leader>a", "ggVG", silent) -- Select all

vim.keymap.set("v", "<BS>", '\"_d', silent) -- Backspace delete visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", silent)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", silent)

vim.keymap.set("v", "<TAB>", ">gv")
vim.keymap.set("v", "<S-TAB>", "<gv")

-- Navigation - Split - Resize
vim.keymap.set("n", "sh", "<C-w>h", silent)
vim.keymap.set("n", "sj", "<C-w>j", silent)
vim.keymap.set("n", "sk", "<C-w>k", silent)
vim.keymap.set("n", "sl", "<C-w>l", silent)

vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", silent)
vim.keymap.set("n", "<leader>sh", ":split<CR>", silent)
vim.keymap.set("n", "<leader>se", "<C-w>=", silent)
vim.keymap.set("n", "<leader>sc", ":close<CR>", silent)

vim.keymap.set("n", "<leader>+", ":vertical resize +4<CR>", silent)
vim.keymap.set("n", "<leader>-", ":vertical resize -4<CR>", silent)

vim.keymap.set("n", "<C-s>", ":set scrollbind! scrollbind?<CR>", silent)

vim.keymap.set("n", "U", "<C-r>", silent) -- U for redo

-- Buffer
vim.keymap.set("n", "<TAB>", ":bnext<CR>", silent)
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", silent)

vim.keymap.set("n", "<leader>b", ":Bdelete hidden<CR>", silent)
vim.keymap.set("n", "<leader>t", ":Bdelete this<CR>", silent)

-- Diffview
vim.keymap.set("n", "<leader>do", "DiffviewOpen<CR>", silent)
vim.keymap.set("n", "<leader>dc", "DiffviewClose<CR>", silent)

-- ZenMode
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", silent)
