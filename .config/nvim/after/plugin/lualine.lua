require('lualine').setup  {
    options = {
        section_separators = { left = '', right = '' },
        component_separators = '',
        theme = "rose-pine",
        icons_enabled = true
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { 'buffers' },
        lualine_x = { 'filetype' },
        lualine_y = { 'encoding', 'location' },
        lualine_z = { }
    }
}
