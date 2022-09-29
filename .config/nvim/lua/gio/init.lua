require("gio.options")
require("gio.packer")

local autocmd = vim.api.nvim_create_autocmd

autocmd('BufWritePost', {
    pattern = 'plugin.lua',
    command = 'source <afile> | PackerCompile'
})

autocmd({'BufWinEnter', 'BufRead', 'BufNewFile'}, {
    pattern = '*',
    command = 'setlocal formatoptions-=r formatoptions-=o'
})

autocmd({'FocusLost', 'WinLeave'}, {
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

-- local au = require("gio.autocomands")
-- local au = require('gio.au')

-- au.define_augroups({
--     _general_settings = {
--         {'BufWinEnter', '*', 'setlocal formatoptions-=r formatoptions-=o'},
--         {'BufRead', '*', 'setlocal formatoptions-=r formatoptions-=o'},
--         {'BufNewFile', '*', 'setlocal formatoptions-=r formatoptions-=o'},
--         {'FocusLost, WinLeave', '*', 'wall'},
--         {'BufReadPre', '*', 'filetype plugin indent on'},
--         {'BufWritePre', '*', '%s/\\s\\+$//e'},
--         {'BufWritePost', 'plugin.lua', 'source <afile> | PackerCompile'},
--         -- {'BufRead', '*', '%s/\\t\\+$/\\s/g'},
--     },
-- })

-- function()
--     vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
-- end

-- -- Blink on yank
-- au.TextYankPost = function()
--     vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
-- end
--
-- -- Packer
-- au.group('PackerGroup', {
--     { 'BufWritePost', 'plugins.lua', 'source <afile> | PackerCompile' },
-- })
--
-- au.BufEnter = {
--     '*.txt',
--     function()
--         if vim.bo.buftype == 'help' then
--             cmd('wincmd L')
--             local nr = vim.api.nvim_get_current_buf()
--             vim.api.nvim_buf_set_keymap(nr, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
--         end
--     end,
-- }
--
-- -- au({ 'BufWinEnter', 'BufRead', 'BufNewFile'}, {
-- -- })
--
-- au({ 'BufNewFile', 'BufRead' }, {
--     '.eslintrc,.prettierrc,*.json*',
--     function()
--         vim.bo.filetype = 'json'
--     end,
-- })
