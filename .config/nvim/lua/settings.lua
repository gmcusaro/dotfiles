-- Settings

-- Neovim API aliases
local cmd  = vim.cmd              -- esecute Vim commands
local exex = vim.api.nvim_exec    -- execute Vimscript
local fn   = vim.fn               -- call Vim function
local g    = vim.g                -- global variables
local o  = vim.opt                -- global/buffer/windows-scoped options

g.modeline=0
g.scriptencoding='utf-8'

-- Don't auto commenting new lines
cmd[[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Remove whitespace on save
cmd[[au BufWritePre * :%s/\s\+$//e]]

cmd[[au FocusLost, WinLeave * :silent! noautocmd w]]

-- Set color column magenta
cmd[[highlight ColorColumn ctermbg=magenta]]

g.nobackup = true
g.nowritebackup = true
g.noswapfile = true
g.noshowmode = false

o.swapfile = false
o.completeopt = 'menuone,noselect,noinsert'
o.mouse = "nv"
o.cmdheight = 2
o.scrolloff = 7
o.clipboard = "unnamedplus"
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.confirm = true
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.list = true
o.showmatch = true
o.ignorecase = true
o.number = true
o.pumblend = 18

-- Theme
o.termguicolors = true
cmd 'colorscheme iceberg'
