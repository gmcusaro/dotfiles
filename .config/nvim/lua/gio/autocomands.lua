local gio_group = vim.api.nvim_create_augroup("GioGroup", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- Remove extra space
autocmd("BufWritePre", {
    group = gio_group,
    pattern = "*",
    callback = function()
        vim.cmd([[ %s/\s\+$//e ]])
    end
})

-- No indent paste
autocmd("InsertLeave", {
    group = gio_group,
    pattern = "*",
    command = "set nopaste"
})

-- Highlight yank
autocmd('TextYankPost', {
    group = gio_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank()
    end
})

-- Create dir when saving file, in case intermediate directory doesn't exist
autocmd({ "BufWritePre" }, {
    pattern = "*",
    group = gio_group,
    callback = function(buf)
        local dir = vim.fn.fnamemodify(buf.file, ":p:h")
        local res = vim.fn.isdirectory(dir)
        if res == 0 then
            vim.fn.mkdir(dir, "p")
        end
    end
})

-- Custom formatoptions
autocmd({ "FileType" }, {
    pattern = '*',
    callback = function()
        vim.opt.formatoptions:remove({ "o", "r" })
    end
})
