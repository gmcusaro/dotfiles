local lsp = require('lsp-zero')
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'marksman',
        'html',
        'cssls',
        'yamlls',
        'jsonls'
    },
    handlers = {
        lsp.default_setup,
    },
})
