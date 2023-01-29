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

-- vim.opt.formatoptions:remove("o")

--opt.formatoptions = opt.formatoptions
--  - 'o'  -- Don't continue comments with o and O
--  + 'j'  -- delete comment character when joining commented lines
--  + 'c'  -- Respect textwidth in comments
--  + 't'  -- auto-wrap text using textwidth
--  + 'r'    -- auto insert comment leader on pressing enter --
--  + 'q'    -- format comments with gq --
--  - 'a'    -- don't autoformat the paragraphs (use some formatter instead) --
--  + 'n'    -- autoformat numbered list --
--  - '2'    -- I am a programmer and not a writer --
--	+ 'l'    -- break long lines in insert mode
--	+ 't'    -- auto-wrap text using textwidth

--opt.formatoptions = vim.opt.formatoptions
--    + 't'
--    + '2'
--    - 'a'
--    + 'n'
--    - 'q'
--    - 'o'
--    - 'r'

--opt.formatoptions = vim.opt.formatoptions - 'o'
--opt.formatoptions = vim.opt.formatoptions:remove('r')
--opt.formatoptions = string.gsub(vim.o.formatoptions, '[o]', '')
