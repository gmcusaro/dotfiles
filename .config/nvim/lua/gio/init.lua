require("gio.options")
require("gio.autocomands")
require("gio.packer")

local autocmd = vim.api.nvim_create_autocmd

local augroup = vim.api.nvim_create_augroup
Gio = augroup('Gio', {})

-- save buff when leave
autocmd({"FocusLost, WinLeave"}, {
    group = Gio,
    pattern = {"*"},
    command = [[wall]]
})

-- remove trailing white spaces
autocmd({"BufWritePre"}, {
    group = Gio,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

-- filetype plugin indent
autocmd({"BufReadPre"}, {
    group = Gio,
    pattern = "*",
    command = "filetype plugin indent on",
})

-- autocmd({"BufWritePost"}, {
--     pattern = "**/lua/packer",
--     command = "source <afile> | PackerCompile"
-- })

-- Configure Packer automatically
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])
