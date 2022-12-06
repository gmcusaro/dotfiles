local nvim_lsp = require('lspconfig')

local format_sync = function()
    vim.lsp.buf.format({ async = false })
end

local rename = function ()
   vim.lsp.buf.rename()
end

local on_attach = function(_, bufnr)

    local opts = {
        noremap = true,
        silent = true,
        buffer = bufnr,
    }

    vim.keymap.set("n", "<leader>d", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", rename, opts)
    -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
    -- vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, { buffer = bufnr })
    -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr })
    -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr })
    vim.keymap.set('n', '<C-f>', format_sync, opts)

    vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
    vim.diagnostic.config({
        virtual_text = true,
        signs = false,
        underline = true,
        update_in_insert = false,
    })
end

-- local on_attach = function(_, bufnr)
--   local buf_map = vim.api.nvim_buf_set_keymap
--   vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
--   vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
--   vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
--   vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
--   vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
--   vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
--   vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
--   vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
--   vim.cmd("command! LspDiagPrev lua vim.lsp.diagnostic.goto_prev()")
--   vim.cmd("command! LspDiagNext lua vim.lsp.diagnostic.goto_next()")
--   vim.cmd(
--       "command! LspDiagLine lua vim.lsp.diagnostic.show_line_diagnostics()")
--   vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
--
--   buf_map(bufnr, "n", "<Leader>dd", ":LspDef<CR>", {silent = true})
--   buf_map(bufnr, "n", "<Leader>rn", ":LspRename<CR>", {silent = true})
--   buf_map(bufnr, "n", "gR", ":LspRefs<CR>", {silent = true})
--   buf_map(bufnr, "n", "<Leader>df", ":LspTypeDef<CR>", {silent = true})
--   buf_map(bufnr, "n", "K", ":LspHover<CR>", {silent = true})
--   buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>", {silent = true})
--   buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>", {silent = true})
--   buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>", {silent = true})
--   -- buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>", {silent = true})
--   buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>",
--           {silent = true})
--   vim.cmd("highlight LspDiagnosticsUnderlineError ctermfg=1 cterm=bold,underline")
--   vim.cmd("highlight LspDiagnosticsUnderlineWarning ctermfg=yellow cterm=bold,underline")
--   vim.cmd("highlight LspDiagnosticsUnderlineHint ctermfg=yellow cterm=underline")
--
--   local signs = { Error = "❌", Warning = "⚠️", Hint = "💡", Information = "ℹ️" }
--
--   for type, icon in pairs(signs) do
--     local hl = "LspDiagnosticsSign" .. type
--     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
--   end
--
-- end

local servers = { "sumneko_lua", "marksman", "html" }

local settings = {
    Lua = {
        runtime = {
            version = 'LuaJIT',
        },
        diagnostics = {
            globals = { 'vim' },
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
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = settings,
    })
end
