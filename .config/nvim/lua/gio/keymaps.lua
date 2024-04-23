local opts = { silent = true, noremap = true }
local keymap = vim.keymap

keymap.set({"n", "v"}, "<leader>", "", opts)
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
keymap.set("n", "<leader>a", "ggVG", opts) -- Select all
keymap.set("n", "<C-s>", ":set scrollbind! scrollbind?<CR>", opts)
keymap.set("n", "U", "<C-r>", opts) -- U for redo
keymap.set("x", "p",'"_dP', opts) -- Fix paste
keymap.set("v", "<BS>", "\"_d", opts) -- Backspace delete visual mode
keymap.set("n", "x", '"_x') -- Do not yank with x
keymap.set("n", "<leader>p", "\"_dP", opts) --replace  selected text with default register without yanking it

keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("n", "J", "mzJ`z")

-- Bring search result to midscreen
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Move in wrap text
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Navigation/Split/Resize
keymap.set("n", "sh", "<C-w>h", opts)
keymap.set("n", "sj", "<C-w>j", opts)
keymap.set("n", "sk", "<C-w>k", opts)
keymap.set("n", "sl", "<C-w>l", opts)

keymap.set("n", "vs", ":vsplit<CR>", opts)
keymap.set("n", "os", ":split<CR>", opts)
keymap.set("n", "es", "<C-w>=", opts)
keymap.set("n", "cs", ":close<CR>", opts)

keymap.set("n", "<leader>+", ":vertical resize +4<CR>", opts)
keymap.set("n", "<leader>-", ":vertical resize -4<CR>", opts)

-- Buffer
keymap.set("n", "<TAB>", ":bnext<CR>", opts)
keymap.set("n", "<S-TAB>", ":bprevious<CR>", opts)

-- Indenting
keymap.set("v", "<TAB>", ">gv")
keymap.set("v", "<S-TAB>", "<gv")
