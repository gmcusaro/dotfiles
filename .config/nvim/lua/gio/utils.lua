local M = {}

function M.current_word()
  return vim.fn.expand("<cword>")
end

function M.current_selection()
    local register = vim.fn.getreg("\"")
    vim.api.nvim_exec("normal! y", false)
    local filter = vim.fn.trim(vim.fn.getreg("@"))
    vim.fn.setreg("\"", register)
    return filter
end

return M
