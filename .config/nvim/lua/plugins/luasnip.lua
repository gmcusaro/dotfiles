return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets"
    },
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip").setup({
            history = true,
            updateevents = "TextChanged,TextChangedI",
        })

        local ls = require("luasnip")
        local silent = { silent = true }

        vim.keymap.set({ "i" }, "<C-k>", function() ls.expand() end, silent)
        vim.keymap.set({ "i", "s" }, "<C-h>", function() ls.jump(-1) end, silent)
        vim.keymap.set({ "i", "s" }, "<C-l>", function() ls.jump(1) end, silent)
        -- vim.keymap.set({ "i", "s" }, "<C-e>", function()
        --     if ls.choice_active() then
        --         ls.change_choice(1)
        --     end
        -- end, silent)
    end
}
