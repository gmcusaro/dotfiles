return {
    "ur4ltz/surround.nvim",
    lazy = false,
    opts = {
        prompt = false,
        mappings_style = "sandwich",
        pairs = {
            nestable = { t = { "(", ")" }, q = { "[", "]" }, g = { "{", "}" }, a = { "<", ">" } },
            linear = {
                q = { "'", "'" },
                d = { '"', '"' },
            }
        },
        prefix = "s"
    }
}
