local lsp = require('lsp-zero')
lsp.preset('recommended')

-- Install these servers
lsp.ensure_installed({
    'sumneko_lua',
    'marksman',
    'html',
    'cssls',
    'yamlls'
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    local bind = vim.keymap.set

    -- bind("n", "gd", vim.lsp.buf.definition, opts)
    bind("n", "K", vim.lsp.buf.hover, opts)
    bind('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
end)

-- Pass arguments to a language server
lsp.configure('tsserver', {
    on_attach = function(client, bufnr)
        print('hello tsserver')
    end,
    settings = {
        completions = {
            completeFunctionCalls = true
        }
    }
})

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
