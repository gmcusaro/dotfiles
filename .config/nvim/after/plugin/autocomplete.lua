local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer' },
    },

    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-a>'] = cmp.mapping.abort(),
    })
})
