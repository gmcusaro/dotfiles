local lspzero = require('lsp-zero')
local lspconfig = require('lspconfig')

local signs = { Error = "󰅚 ", Warn = " ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lspzero.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
end)

lspzero.setup()

local lua_opts = lspzero.nvim_lua_ls({
    single_file_support = false
})

lspconfig.lua_ls.setup(lua_opts)

lspconfig.tsserver.setup({
    single_file_support = false,
    settings = {
        completions = {
            completeFunctionCalls = true
        }
    },
    on_init = function(client)
        -- disable formatting capabilities
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
    end,
})

-- Swift
 local swift_lsp = vim.api.nvim_create_augroup("swift_lsp", { clear = true })

 vim.api.nvim_create_autocmd("FileType", {
 	pattern = { "swift" },
 	callback = function()
 		local root_dir = vim.fs.dirname(vim.fs.find({
 			"Package.swift",
 			".git",
 		}, { upward = true })[1])
 		local client = vim.lsp.start({
 			name = "sourcekit-lsp",
 			cmd = { "sourcekit-lsp" },
 			root_dir = root_dir,
 		})
 		vim.lsp.buf_attach_client(0, client)
 	end,
 	group = swift_lsp,
 })

