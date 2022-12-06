require("gio.options")
require("gio.packer")

local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePost', {
    pattern = 'plugin.lua',
    command = 'source <afile> | PackerCompile'
})

autocmd({ 'BufWinEnter', 'BufRead', 'BufNewFile' }, {
    pattern = '*',
    command = 'setlocal formatoptions-=r formatoptions-=o'
})

autocmd({ 'FocusLost', 'WinLeave' }, {
    pattern = '*',
    command = 'wall'
})

autocmd('BufWritePre', {
    pattern = '*',
    command = "%s/\\s\\+$//e",
})

autocmd('BufReadPre', {
    pattern = '*',
    command = 'filetype plugin indent on'
})

autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})
