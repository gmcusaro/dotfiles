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

autocmd('BufWritePre', {
    pattern = '*',
    desc = 'Run LSP formatting on save',
    command = ':Format'
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
