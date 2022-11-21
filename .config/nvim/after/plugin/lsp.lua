local nvim_lsp = require('lspconfig')

local on_attach = function(_, bufnr)
    vim.keymap.set("n", "D", vim.lsp.buf.declaration, { buffer = bufnr })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { buffer = bufnr })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr })

    vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})

    -- configure how lsp diagnostics are shown
    vim.diagnostic.config({
        virtual_text = true, signs = false,
        underline = true, update_in_insert = false,
    })
end

local servers = { "sumneko_lua", "marksman" }

local settings = {
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
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = settings,
    })
end
