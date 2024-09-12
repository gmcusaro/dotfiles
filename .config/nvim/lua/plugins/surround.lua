-- return {
--     "ur4ltz/surround.nvim",
--     lazy = false,
--     opts = {
--         prompt = false,
--         mappings_style = "sandwich",
--         pairs = {
--             nestable = {
--                 t = { "(", ")" },
--                 q = { "[", "]" },
--                 g = { "{", "}" },
--                 a = { "<", ">" }
--             },
--             linear = {
--                 q = { "'", "'" },
--                 d = { '"', '"' },
--             }
--         },
--         prefix = 's'
--     }
-- }

-- return {
--     "echasnovski/mini.nvim",
--     version = false,
--     opts = {
--         mappings = {
--             add = "gsa",
--             delete = "gsd",
--             find = "gsf",
--             find_left = "gsF",
--             highlight = "gsh",
--             replace = "gsr",
--             update_n_lines = "gsn",
--         }
--     }
-- }


return {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "sa",
        delete = "sd",
        find = "sf",
        find_left = "sF",
        highlight = "sh",
        replace = "sr",
        update_n_lines = "sn",
      },
    },
  }
