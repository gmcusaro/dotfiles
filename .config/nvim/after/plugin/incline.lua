local function get_diagnostic_label(props)
    local icons = {
        Error = '',
        Warn = '',
        Info = '',
        Hint = '',
    }

    local label = {}
    for severity, icon in pairs(icons) do
        local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
        if n > 0 then
            table.insert(label, { icon .. ' ' .. n .. ' ', group = 'DiagnosticSign' .. severity })
        end
    end
    return label
end

function table_to_string(tbl)
    local result = "{"
    for k, v in pairs(tbl) do
        -- Check the key type (ignore any numerical keys - assume its an array)
        if type(k) == "string" then
            result = result.."[\""..k.."\"]".."="
        end

        -- Check the value type
        if type(v) == "table" then
            result = result..table_to_string(v)
        elseif type(v) == "boolean" then
            result = result..tostring(v)
        else
            result = result.."\""..v.."\""
        end
        result = result..","
    end
    -- Remove leading commas from the result
    if result ~= "" then
        result = result:sub(1, result:len()-1)
    end
    return result.."}"
end

require('incline').setup({
    render = function(props)
        local bufname = vim.api.nvim_buf_get_name(props.buf)
        local filename = vim.fn.fnamemodify(bufname, ":t")
        local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)

        local diagnostics = get_diagnostic_label(props)


        local buffer = {
            { filetype_icon },
            { " " },
            { filename },
        }

        -- if #diagnostics > 0 then
        --     table.insert(diagnostics, { "| ", guifg = "grey" })
        -- end
        for _, buffer_ in ipairs(buffer) do
            table.insert(diagnostics, buffer_)
        end
        return buffer
    end,

    window = {
        margin = { horizontal = 0 },
        padding = 2,
    },
})

