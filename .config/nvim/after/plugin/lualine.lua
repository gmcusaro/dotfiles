local lualine = require('lualine')

local mocha = require("catppuccin.palettes").get_palette "mocha"

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,

    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
}

-- Config
local config = {
    options = {
        component_separators = '',
        section_separators = '',
        theme = 'catppuccin',
        disabled_filetypes = { 'NeogitStatus' }
        ,
    },
    sections = {
        lualine_a = { 'fancy_mode' },
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},

        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left {
    "branch",
    color = { fg = mocha.mauve, gui = 'bold' },
}

ins_left {
    "diff",
    symbols = { added = ' ', modified = '󱓼 ', removed = ' ' },
    diff_color = {
        added = { fg = mocha.green },
        modified = { fg = mocha.yellow },
        removed = { fg = mocha.red },
    },
}

ins_left {
    function()
        return '%='
    end,
}

ins_left {
    'filename', file_status = true, path = 1,
    icons_enabled = true,
    color = { fg = '#ffffff', gui = 'bold' },
    cond = conditions.buffer_not_empty,
}

ins_left {
    'filesize',
    cond = conditions.buffer_not_empty,
}

-- ins_right {
--     "fileformat", icons_enabled = true,
-- }

-- ins_left {
--     "filetype", icons_enabled = true
-- }

ins_right {
    function()
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return 'NO LSP'
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
    end,
    color = { fg = '#ffffff' },
}

ins_right {
    function()
        return ' | '
    end,
    color = { fg = '#ffffff' }
}

ins_right {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = "󰅚 ", warn = " ", hint = "󰌶 ", info = " "  },
    diagnostics_color = {
        color_error = { fg = mocha.red },
        color_warn = { fg = mocha.yellow },
        color_info = { fg = mocha.sky},
    },
}

ins_right {
    'o:encoding',
    fmt = string.upper,
    cond = conditions.hide_in_width,
}

ins_right {
    '%l:%c', '%p%%/%L' -- 'fancy_location'
}

ins_right {
    'progress'
}

lualine.setup(config)
