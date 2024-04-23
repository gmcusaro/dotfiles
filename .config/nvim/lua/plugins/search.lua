return {
    "backdround/improved-search.nvim",
    lazy = false,
    config = function()
        local search = require("improved-search")
        -- Search current word without moving.
        vim.keymap.set("n", "!", search.current_word)

        -- Search selected text in visual mode
        vim.keymap.set("x", "f", search.in_place)

        -- Search next / previous.
        vim.keymap.set({ "n", "x", "o" }, "n", search.stable_next)
        vim.keymap.set({ "n", "x", "o" }, "N", search.stable_previous)
    end
}
