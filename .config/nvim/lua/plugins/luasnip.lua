local config = function()
    require("luasnip.loaders.from_vscode").lazy_load()

    require("luasnip").setup({
        history = true,
        updateevents = "TextChanged,TextChangedI",
    })
end

return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets"
    },
    config = config
}
