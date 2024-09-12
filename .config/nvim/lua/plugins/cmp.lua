return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-buffer"
    },
    config = function()
        local cmp = require "cmp"
        local luasnip = require("luasnip")


        local border_opts = {
            border = "rounded",
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        }

        cmp.setup({
            -- completion = {
            --     completeopt = 'menu,menuone,preview,noinsert',
            -- },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            formatting = {
                format = function(_, vim_item)
                    vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
                    return vim_item
                end
            },
            window = {
                completion = cmp.config.window.bordered(border_opts),
                documentation = cmp.config.window.bordered(border_opts),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),

                ["<C-a>"] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }),

                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }),

                -- ["<Tab>"] = cmp.mapping(function(fallback)
                --     if cmp.visible() then
                --         cmp.mapping.select_next_item()
                --     elseif luasnip.expand_or_jumpable() then
                --         luasnip.expand_or_jump()
                --     else
                --         fallback()
                --     end
                -- end, { "i", "s" }),

                -- ["<S-Tab>"] = cmp.mapping(function(fallback)
                --     if cmp.visible() then
                --         cmp.mapping.select_prev_item()
                --     elseif luasnip.jumpable(-1) then
                --         luasnip.jump(-1)
                --     else
                --         fallback()
                --     end
                -- end, { "i", "s" })

                ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
                ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),

            }),

            -- sources = cmp.config.sources({
            --     { name = "luasnip", },
            --     { name = "nvim_lsp", },
            --     { name = "cmp-path", },
            --     -- { name = "buffer",   priority = 250 },
            --     -- { name = "path",     priority = 500 }
            -- })

            sources = cmp.config.sources({
                { name = "luasnip" },
                { name = "nvim_lsp" },
                { name = "cmp-path" },
                { name = "path" },
                { name = "buffer" }
            })
        })

        --     -- Use buffer source for `/`.
        --     cmp.setup.cmdline("/", {
        --         mapping = cmp.mapping.preset.cmdline(),
        --         sources = {
        --             { name = "buffer" }
        --         }
        --     })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'cmdline' },
                { name = 'path' },
            })
        })
    end
}
