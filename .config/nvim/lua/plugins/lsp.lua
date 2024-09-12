return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- "WhoIsSethDaniel/mason-tool-installer.nvim",

        "b0o/SchemaStore.nvim",
        "stevearc/conform.nvim",
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, func)
                    vim.keymap.set("n", keys, func, { buffer = event.buf, remap = false })
                end

                vim.keymap.set("n", "<C-'>", "<C-^>", { buffer = event.buf, silent = true, noremap = true })
                map("gd", function() vim.lsp.buf.definition() end)
                map("K", vim.lsp.buf.hover)
                map("gr", function() vim.lsp.buf.references() end)

                map("<leader>ds", require("telescope.builtin").lsp_document_symbols)
                map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols)
                map("<leader>rn", vim.lsp.buf.rename)

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end
            end
        })

        local signs = { Error = " ", Warn = "󱇎 ", Hint = "󰌶 ", Info = "󰰄 " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        vim.diagnostic.config({
            signs = true,
            virtual_text = true,
            update_in_insert = false,
            underline = false,
            float = {
                -- focusable = false,
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },
        })

        local lspconfig = require("lspconfig")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        local handlers = {
            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
            ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
        }

        local servers = {
            pyright = true,
            html = true,
            astro = true,
            ts_ls = true,
            cssls = true,
            marksman = true,
            sourcekit = {
                cmd = { "xcrun", "sourcekit-lsp" },
                filetypes = { "swift", "objective-c", "objective-cpp" },
                rootPatterns = { "Package.swift", "*.xcodeproj", "*.xcworkspace", ".git" },
                single_file_support = true,
            },

            yamlls = {
                settings = {
                    yaml = {
                        schemaStore = {
                            enable = false,
                            url = "",
                        },
                        schemas = require("schemastore").yaml.schemas(),
                    },
                },
            },

            jsonls = {
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = {
                            enable = true,
                        },
                    },
                },
            },

            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                        runtime = {
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            globals = {
                                "vim",
                            }
                        }
                    },
                },
            },
        }

        require("mason").setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            "lua_ls",
            "stylua",
        })

        for name, config in pairs(servers) do
            if config == true then
                config = {}
            end
            config = vim.tbl_deep_extend("force", {}, {
                capabilities = capabilities,
                handlers = handlers,
            }, config)

            lspconfig[name].setup(config)
        end
    end
}
