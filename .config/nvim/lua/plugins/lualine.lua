return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local mocha = require("catppuccin.palettes").get_palette "mocha"

        local modes = {
            ["n"] = "NOR",
            ["no"] = "NOR",
            ["v"] = "VIS",
            ["V"] = "VIS-L",
            [""] = "VIS-B",
            ["s"] = "SEL",
            ["S"] = "SEL-L",
            [""] = "SEL-B",
            ["i"] = "INS",
            ["ic"] = "INS",
            ["R"] = "REPL",
            ["Rv"] = "VIS-R",
            ["c"] = "CMD",
            ["cv"] = "VIM EX",
            ["ce"] = "EX",
            ["r"] = "PROMPT",
            ["rm"] = "MOAR",
            ["r?"] = "CONFIRM",
            ["!"] = "SHELL",
            ["t"] = "TERM",
        }

        local function mode()
            local current_mode = vim.api.nvim_get_mode().mode
            return string.format("%s", modes[current_mode]):upper()
        end

        require("lualine").setup {
            options = {
                component_separators = "",
                section_separators = "",
                theme = "catppuccin",
                disabled_filetypes = {
                    "TelescopePrompt",
                    "qf",
                    "fugitive",
                    "lazy",
                    "mason",
                    "undotree"
                },
            },
            sections = {
                lualine_a = { mode },
                lualine_b = {},
                lualine_c = {
                    {
                        "diff",
                        symbols = { added = ' ', modified = '󱓻 ', removed = ' ' },
                        diff_color = {
                            added = { fg = mocha.green },
                            modified = { fg = mocha.subtext0 },
                            removed = { fg = mocha.red },
                        }
                    },
                    {
                        "%="
                    },
                    {
                        "buffers",
                        show_filename_only = true,
                        hide_filename_extension = false,
                        show_modified_status = true,
                        icons_enabled = false,
                        mode = 0,
                        max_length = vim.o.columns * 2 / 3,
                        symbols = {
                            modified = " [+]",
                            alternate_file = ""
                        },
                        buffers_color = {
                            inactive = { fg = mocha.flamingo },
                            active = { fg = mocha.subtext1, gui = "bold" }
                        }
                    }
                },
                lualine_x = {
                    {
                        "diagnostics",
                        sources = { "nvim_lsp", "nvim_diagnostic", "nvim_workspace_diagnostic" },
                        symbols = {
                            error = " ",
                            warn = "󱇎 ",
                            hint = "󰌶 ",
                            info = "󰰄 "
                        },
                        diagnostics_color = {
                            error = { fg = mocha.red },
                            warn  = { fg = mocha.subtext1 },
                            info  = { fg = mocha.subtext1 },
                            hint  = { fg = mocha.subtext1 }
                        }
                    },
                    {
                        "branch",
                        icon = "",
                        color = { fg = mocha.maroon, gui = "bold" }
                    }
                },
                lualine_y = {
                    {
                        "%l:%c", "%p%%/%L"
                    }
                },
                lualine_z = {},
            }
        }
    end
}
