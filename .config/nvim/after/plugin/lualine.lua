local lualine = require('lualine')

local colors = {
  fg       = '#bbc2cf',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  red      = '#ec5f67',
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,

    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,

    -- check_git_workspace = function()
    --     local filepath = vim.fn.expand('%:p:h')
    --     local gitdir = vim.fn.finddir('.git', filepath .. ';')
    --     return gitdir and #gitdir > 0 and #gitdir < #filepath
    -- end,
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
    color = { fg = colors.violet, gui = 'bold' },
}

ins_left {
    "diff",
    symbols = { added = ' ', modified = '柳', removed = ' ' },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.yellow },
        removed = { fg = colors.red },
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

-- ins_left {
--     "filetype", icons_enabled = true
-- }

ins_right {
    function()
        local msg = 'No active LSP'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    -- icon = '',
    color = { fg = '#ffffff' },
}

ins_right {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " " },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
    },
}

ins_right {
    'o:encoding',
    fmt = string.upper,
    cond = conditions.hide_in_width,
}

ins_right {
    -- 'fancy_location',
    '%l:%c', '%p%%/%L'
}

-- ins_right {
--     "fileformat",
--     icons_enabled = true,
-- }

ins_right {
    'progress'
}

lualine.setup(config)
