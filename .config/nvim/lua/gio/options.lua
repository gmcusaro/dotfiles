local opt = vim.opt -- Floating window popup menu
local g   = vim.g   -- Global variables
local wo  = vim.wo  -- Window scoped

g.mapleader = ' '
g.maplocalleader = ' '
g.backup = false
g.writebackup = false
g.swapfile = false
g.netrw_browse_split = 0

opt.mouse = 'nv'
opt.clipboard = 'unnamedplus'

opt.termguicolors = true
opt.errorbells = true

opt.pumblend = 15
opt.wildmode = 'longest,full'
opt.wildoptions = 'pum'
opt.showmode = false
opt.signcolumn = 'yes'

opt.scrolloff = 8
opt.sidescrolloff = 8
opt.numberwidth = 4
opt.number = true
opt.relativenumber = true

opt.cursorline = true
opt.laststatus = 3
opt.cmdheight = 2
opt.conceallevel = 0
opt.linebreak = true

opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.smartindent = true
opt.smartcase = true

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
g.showmatch = true

opt.conceallevel = 0
opt.splitbelow = true
opt.splitright = true
opt.equalalways = false

opt.timeoutlen = 400
opt.updatetime = 300

g.autopairs_enabled = true
wo.signcolumn = 'yes'
opt.confirm = true

opt.shortmess = opt.shortmess
    + 'I' -- remove intro screen
    + 'a' -- use abbraviations
    + 'O' -- file-read message overwrites previous
    + 'A' -- remove swap file messages
    + 'W' -- don't echo "[w]"/"[written]" when writing
    - 'o' -- Don't continue comments with o and O
