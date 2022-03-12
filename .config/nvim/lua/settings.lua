-- Settings

-- Neovim API aliases
local cmd  = vim.cmd              -- esecute Vim commands
local exex = vim.api.nvim_exec    -- execute Vimscript
local fn   = vim.fn               -- call Vim function
local g    = vim.g                -- global variables
local o    = vim.opt              -- global/buffer/windows-scoped options

g.modeline=0
g.scriptencoding='utf-8'

cmd[[au BufEnter * set fo-=c fo-=r fo-=o]] -- Don't auto commenting new lines
cmd[[au BufWritePre * :%s/\s\+$//e]] -- Remove whitespace on save
cmd[[au FocusLost, WinLeave * :silent! noautocmd w]] -- Auto save files when focus is lost
cmd[[highlight ColorColumn ctermbg=magenta]] -- Set color column magenta

-- Disable backup and swap files
g.nobackup = true
g.nowritebackup = true
g.noswapfile = true

g.noshowmode = false
o.completeopt = 'menu,menuone,noselect,noinsert'
o.pumblend = 18
o.wildmode = 'longest:full'

-- Eliminate delays
o.timeout = false
o.timeoutlen = 0
o.ttimeout = false
o.ttimeoutlen = 0

o.mouse = "nv" -- Enable mouse support
o.scrolloff = 10 -- Make it so there are always ten lines below my cursor

-- Set tab behavior
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true

o.confirm = true
o.smartcase = true

o.splitbelow = true -- Split direction below
o.splitright = true -- Split direction right
o.equalalways = false -- Not resize other windows

o.showmatch = true
o.ignorecase = true -- Ignore case when searching

o.number = true
o.breakindent = true

o.list = true -- Show whitespace characters
o.clipboard = "unnamedplus" -- Use the system clipboard
o.shortmess:append("I") -- Do not show the startup message

o.termguicolors = true
cmd 'colorscheme nightfox' -- Theme
