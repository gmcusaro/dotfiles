local config = function()
    local servers = {
        html = {},
        tsserver = {},
        cssls = {},
        marksman = {
            filetypes = { "markdown", "markdown.mdx" }
        },
        yamlls = {},
        jsonls = {},
        lua_ls = {
            Lua = {
                workspace = {
                    checkThirdParty = false,
                    library = {
                        '${3rd}/luv/library',
                        library = vim.api.nvim_get_runtime_file('', true),
                    },
                },
                telemetry = { enable = false },
                diagnostics = {
                    enable = true,
                    globals = { "vim", "on_attach" },
                }
            }
        },
    }

    local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    }

    local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        local giomap = function(keys, func)
            vim.keymap.set("n", keys, func, { buffer = bufnr})
        end
        giomap("K", vim.lsp.buf.hover)
        giomap("gd", require("telescope.builtin").lsp_definitions)
        giomap("gr", require("telescope.builtin").lsp_references)
        giomap("<leader>ds", require("telescope.builtin").lsp_document_symbols)
        giomap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
        giomap('<leader>rn', vim.lsp.buf.rename)


        -- giomap("<leader>d", function() require("telescope.builtin").diagnostics() end )
        -- vim.keymap.set("n", "<leader>d", function() require("telescope.builtin").diagnostics() end)

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        -- map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap
        -- map('K', vim.lsp.buf.hover, 'Hover Documentation')

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header
        -- map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')



        -- local opts = { silent = true, noremap = true, buffer = bufnr }

        -- vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
        -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        -- vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, opts)

        giomap("<leader>f", function() vim.lsp.buf.format { async = true } end)

        -- -- local builtin = require("telescope.builtin")
        -- -- vim.keymap.set("n", "gr", builtin.lsp_references(), opts)
        -- -- vim.keymap.set("n", "<leader>xx", builtin.lsp_workspace_symbol())
        -- -- vim.keymap.set("n", "<C-d>", require("telescope.builtin").diagnostics(), opts)

        -- local builtin = require("telescope.builtin")
        -- vim.keymap.set("n", "gr", function() builtin.lsp_references() end)
        -- vim.keymap.set("n", "<leader>ds", function() builtin.lsp_document_symbols() end)

        -- -- vim.keymap.set('n', '<leader>qgr', function() builtin.lsp_references() end)
        -- -- vim.keymap.set('n', '<leader>qs', function() builtin.lsp_document_symbols() end)
        -- vim.keymap.set("n", "<leader>d", function() require("telescope.builtin").diagnostics() end)
        -- vim.keymap.set("n", "<leader>ws", function() builtin.lsp_workspace_symbols() end)
        -- -- vim.keymap.set('n', '<leader>qgi', function() builtin.lsp_implementations() end)

        -- for _, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
        --     vim.fn.sign_define("DiagnosticSign" .. diag, {
        --         text = "",
        --         texthl = "DiagnosticSign" .. diag,
        --         linehl = "",
        --         numhl = "DiagnosticSign" .. diag,
        --     })
        -- end

        local signs = { Error = "󰅚 ", Warn = " ", Hint = "󰌶 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        vim.diagnostic.config({
            signs = true,
            update_in_insert = false,
            underline = false,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = '',
            }
        })
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = true
    })

    mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
        function(server_name)
            require('lspconfig')[server_name].setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = servers[server_name],
                handlers = handlers,
                filetypes = (servers[server_name] or {}).filetypes,
            }
        end,
    }

    -- Swift - Settings for macOS
    require("lspconfig").sourcekit.setup {
        cmd = { "/library/developer/commandlinetools/usr/bin/sourcekit-lsp" },
        single_file_support = true,
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers
    }

    require("lspconfig.ui.windows").default_options.border = "rounded"

    vim.diagnostic.config({
        float = {
            border = "rounded",
        },
    })
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
    },
    config = config
}
