local o = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "
g.backup = false
g.writebackup = false
g.swapfile = false
o.confirm = true
o.updatetime = 250
o.timeoutlen = 300

o.mouse = "nv"
o.clipboard = "unnamed,unnamedplus"
o.termguicolors = true
o.pumblend = 20
o.wildmode = "lastused,list:full"
o.wildoptions = "pum"
o.showmode = false
o.cmdheight = 2
o.laststatus = 3

o.cursorline = true
o.scrolloff = 8
o.sidescrolloff = 8
o.number = true
o.relativenumber = true

o.signcolumn = "yes"
o.linebreak = true
o.breakindent = true
o.expandtab = true
o.smartcase = true
o.ignorecase = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
g.showmatch = true

o.splitbelow = true
o.splitright = true
o.equalalways = false

o.timeoutlen = 500
o.updatetime = 400
o.shortmess = "IaOAWo"
