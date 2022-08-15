local neogit_extension = {
  filetypes = {'NeogitStatus', 'NeogitCommitMessage', 'NeogitPopup', 'NeogitLogView', 'NeogitGitCommandHistory'}
}

require('lualine').setup {
    options = {
        section_separators = { left = '', right = '' },
        component_separators = '',
        theme = "rose-pine",
        icons_enabled = true,
        disabled_filetypes = { 'NeogitStatus', 'Packer' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { {
            'filename',
            file_status = true,
            path = 0,
            symbols = {
                modified = ' ●',
                readonly = ' '
            }
        } },
        lualine_x = { },
        lualine_y = { 'filetype', 'encoding', 'location' },
        lualine_z = { }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {{
            'filename',
            file_status = true,
            path = 1
        }},
        lualine_x = { },
        lualine_y = { 'location' },
        lualine_z = { }
    },
    tabline = { },
    extensions = { neogit_extension }
}
