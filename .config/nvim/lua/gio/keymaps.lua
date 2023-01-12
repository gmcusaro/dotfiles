local M = {}

-- make reafact https://github.com/toddky/nvim/blob/8f0f38aae8fc31a3524c51fbfd42e5166066d75a/lua/util/init.lua

function Bind(op, outer_opts)
    outer_opts = outer_opts or { noremap = true }
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = Bind('n', { noremap = false })
M.nnoremap = Bind('n')
M.vnoremap = Bind('v')
M.xnoremap = Bind('x')
M.inoremap = Bind('i')

M.opts = {
    noremap = true,
    silent = true,
}

return M
