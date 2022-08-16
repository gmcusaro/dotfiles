local cmp = require('cmp')
-- local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
      ['<leader>k'] = cmp.mapping.scroll_docs(-5),
      ['<leader>j'] = cmp.mapping.scroll_docs(5),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({
          select = true,
          behavior = cmp.ConfirmBehavior.Replace,
      }),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-j>'] = cmp.mapping.select_next_item(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'luasnip' },
        { name = 'buffer' }
    }),
    -- formatting = {
    --     format = lspkind.cmp_format({
    --         wirth_text = false,
    --         maxwidth = 50,
    --     }),
    -- },
})

local miao = m
