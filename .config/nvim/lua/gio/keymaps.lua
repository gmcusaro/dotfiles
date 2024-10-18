local opts = { silent = true, noremap = true }
local map = vim.keymap

-- vim.keymap.set("i", "jk", "<Esc>", opts)
vim.keymap.set("n", "<Esc>", function()
    vim.fn.setreg("/", "")
    vim.cmd("nohlsearch")
    vim.cmd("echo ''")
end, opts)

-- map.set("n", "<C-s>", "<cmd>scrollbind! scrvllbind?<CR>", opts)
map.set("n", "<leader>a", "ggVG", opts)     -- Select all
map.set("n", "F", "^", { noremap = false }) -- First word
map.set("v", "K", ":m '<-2<CR>gv=gv", opts) -- Move line up
map.set("v", "J", ":m '>+1<CR>gv=gv", opts) -- Move line down
map.set("n", "U", "<C-r>", opts)            -- U for redo
map.set("v", "<BS>", '"_d', opts)           -- Delete without yank in visual mode
map.set("n", "x", '"_x')                    -- Do not yank with x
map.set("x", "p", '"_dP', opts)             -- Do not yank the replaced text after pasting
map.set("n", "gp", [[`[v`]']], opts)        -- Select just pasted

-- Bring search result to midscreen
map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")

-- Move in wrap text
map.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "gk", [[?^##\+<CR>]], { buffer = true, silent = true })
vim.keymap.set("n", "gj", [[/^##\+<CR>]], { buffer = true, silent = true })

-- Navigation/Split/Resize
map.set("n", "wh", "<C-w>h", opts)
map.set("n", "wj", "<C-w>j", opts)
map.set("n", "wk", "<C-w>k", opts)
map.set("n", "wl", "<C-w>l", opts)
map.set("n", "vs", ":vsplit<CR>", opts)
map.set("n", "os", ":split<CR>", opts)
map.set("n", "es", "<C-w>=", opts)
map.set("n", "cs", ":close<CR>", opts)
map.set("n", "<leader>+", ":vertical resize +4<CR>", opts)
map.set("n", "<leader>-", ":vertical resize -4<CR>", opts)

-- Buffer
map.set("n", "<TAB>", ":bnext<CR>", opts)
map.set("n", "<S-TAB>", ":bprevious<CR>", opts)

-- Indenting
map.set("v", "<TAB>", ">gv")
map.set("v", "<S-TAB>", "<gv")
