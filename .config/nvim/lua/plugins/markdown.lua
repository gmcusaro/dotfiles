return {
    {
        "tadmccorkle/markdown.nvim",
        ft = "markdown",
        opts = {
            mappings = {
                inline_surround_toggle = "s",
                link_follow = "<cr>",
            },
            inline_surround = {
                emphasis = {
                    key = "i",
                    txt = "*",
                },
                strong = {
                    key = "g",
                    txt = "**",
                },
                strikethrough = {
                    key = "s",
                    txt = "~~",
                },
                code = {
                    key = "c",
                    txt = "`",
                }
            }
        }
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    }
}
