local lsp = require('lsp-zero')
lsp.preset('recommended')

-- Install these servers
lsp.ensure_installed({
    'lua_ls',
    'marksman',
    'html',
    'cssls',
    'yamlls',
    'jsonls'
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(_ , bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
end)

lsp.configure('tsserver', {
    settings = {
        completions = {
            completeFunctionCalls = true
        }
    }
})

lsp.nvim_workspace()

lsp.setup()







-- local lsp = require('lsp-zero')
-- lsp.preset('recommended')
--
-- -- Install these servers
-- lsp.ensure_installed({
--     'lua_ls',
--     'marksman',
--     'html',
--     'cssls',
--     'yamlls',
--     'jsonls'
-- })
--
-- lsp.set_preferences({
--     suggest_lsp_servers = false,
--     sign_icons = {
--         error = 'E',
--         warn = 'W',
--         hint = 'H',
--         info = 'I'
--     }
-- })
--
-- lsp.on_attach(function(client, bufnr)
--     local opts = {buffer = bufnr, remap = false}
--     local bind = vim.keymap.set
--
--     -- bind("n", "gd", vim.lsp.buf.definition, opts)
--     bind("n", "K", vim.lsp.buf.hover, opts)
--     bind('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
-- end)
--
-- -- Pass arguments to a language server
-- lsp.configure('tsserver', {
--     on_attach = function(client, bufnr)
--         print('hello tsserver')
--     end,
--     settings = {
--         completions = {
--             completeFunctionCalls = true
--         }
--     }
-- })
--
-- -- Configure lua language server for neovim
-- lsp.nvim_workspace()
--
-- lsp.setup()
