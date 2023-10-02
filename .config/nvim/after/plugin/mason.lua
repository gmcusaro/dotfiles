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
        require('lsp-zero').default_setup,
    },
})
