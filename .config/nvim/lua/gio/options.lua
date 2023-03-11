local opt = vim.opt -- Floating window popup menu
local g   = vim.g   -- Global variables
local wo  = vim.wo  -- Window scoped

g.mapleader = ' '
g.maplocalleader = ' '

opt.mouse = 'nv'
opt.clipboard = 'unnamedplus'

opt.termguicolors = true
opt.errorbells = true

opt.pumblend = 15
opt.wildmode = 'longest,full'
opt.wildoptions = 'pum'
opt.showmode = false
opt.signcolumn = 'yes'

g.backup = false
g.writebackup = false
g.swapfile = false

opt.scrolloff = 8
opt.sidescrolloff = 5
opt.numberwidth = 4

opt.number = true
opt.relativenumber = true

opt.cursorline = true
opt.laststatus = 3 -- use one statusline for many buffers
opt.cmdheight = 2
opt.whichwrap = 'b,s,<,>,[,],h,l'
opt.conceallevel = 0
opt.linebreak = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.smartcase = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
g.showmatch = true

opt.conceallevel = 0

opt.splitbelow = true
opt.splitright = true
opt.equalalways = false

-- Eliminate delays
opt.timeout = false
opt.timeoutlen = 100
opt.updatetime = 750 -- Stop longer updatetime

wo.signcolumn = 'yes'
-- wo.colorcolumn = "80" -- da inserire come autocomand regex

opt.updatetime = 1500 -- ms of inactivity it takes to update swap
opt.confirm = true

opt.shortmess = opt.shortmess
		+ 'I' -- remove intro screen
		+ 'a' -- use abbraviations
		+ 'O' -- file-read message overwrites previous
		+ 'A' -- remove swap file messages
		+ 'W' -- don't echo "[w]"/"[written]" when writing
        - 'o' -- Don't continue comments with o and O

-- aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa


