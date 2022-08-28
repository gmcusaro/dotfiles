local nvim_lsp = require('lspconfig')

nvim_lsp.sumneko_lua.setup {
    -- on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
