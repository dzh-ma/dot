return {
    {
        'maxmx03/fluoromachine.nvim',
        config = function ()
            local fm = require('fluoromachine')

            fm.setup({
                overrides = {
                    ["@neorg.anchors.norg"] = { fg = "#200933", bg = "#61E2FF" },
                    ["@neorg.anchors.declaration.norg"] = { fg = "#200933", bg = "#FF8B39" },
                    ["@neorg.links.location.url.norg"] = { fg = "#200933", bg = "#FC199A" },
                    ["@neorg.tags.ranged_verbatim.begin.norg"] = { fg = "#200933", bg = "#AF6DF9" },
                    ["@neorg.tags.ranged_verbatim.end.norg"] = { fg = "#200933", bg = "#FE4450" },
                    ["@neorg.tags.ranged_verbatim.name.word.norg"] = { fg = "#200933", bg = "#72F1B8" },
                },
            })

            vim.cmd.colorscheme('fluoromachine')
        end,
    },

    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("hlchunk").setup({
                chunk = {
                    enable = true
                },
                indent = {
                    enable = true,
                },
            })
        end
    },
}
