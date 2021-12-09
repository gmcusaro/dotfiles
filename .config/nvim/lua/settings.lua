-- Settings

-- Neovim API aliases
local cmd  = vim.cmd              -- esecute Vim commands
local exex = vim.api.nvim_exec    -- execute Vimscript
local fn   = vim.fn               -- call Vim function
local g    = vim.g                -- global variables
local o    = vim.opt              -- global/buffer/windows-scoped options

g.modeline=0
g.scriptencoding='utf-8'

-- Don't auto commenting new lines
cmd[[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Remove whitespace on save
cmd[[au BufWritePre * :%s/\s\+$//e]]

-- Auto save files when focus is lost
cmd[[au FocusLost, WinLeave * :silent! noautocmd w]]

-- Set color column magenta
cmd[[highlight ColorColumn ctermbg=magenta]]

-- Disable backup and swap files
g.nobackup = true
g.nowritebackup = true
g.noswapfile = true

--Do not show the mode in the command line
g.noshowmode = false

o.completeopt = 'menu,menuone,noselect,noinsert'

-- Eliminate delays
o.timeout = false
o.timeoutlen = 0
o.ttimeout = false
o.ttimeoutlen = 0

-- Enable mouse support
o.mouse = "nv"
o.cmdheight = 2
o.scrolloff = 7
o.clipboard = "unnamedplus"

-- Use tabs
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true

o.confirm = true
o.smartcase = true

-- Split direction
o.splitbelow = true
o.splitright = true

o.showmatch = true
o.ignorecase = true

o.number = true

o.pumblend = 18

-- Show whitespace characters
o.list = true
o.listchars = { space = "·", tab = "» ", eol = "¬" }

-- Use the system clipboard
o.clipboard = "unnamedplus"

-- Do not show the startup message
o.shortmess:append("I")

-- Theme
o.termguicolors = true
cmd 'colorscheme nightfox'
