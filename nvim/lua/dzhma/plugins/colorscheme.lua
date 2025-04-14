return {
    {
        "diegoulloao/neofusion.nvim",
        dependencies = {
            "nvim-lualine/lualine.nvim",
        },
        priority = 1000,
        config = function ()
            require("neofusion").setup({
                overrides = {
                    ["@neorg.markup.bold.norg"] = { fg = "#e2d9c5", bold = true },
                    ["@neorg.markup.italic.norg"] = { fg = "#ec30ac", italic = true },
                    ["@neorg.markup.underline.norg"] = { fg = "#fd5e3a", underline = true },
                    ["@neorg.markup.verbatim.norg"] = { fg = "#ffffff", bg = "#000000" },
                    ["@neorg.markup.inline_math.norg"] = { fg = "#000000", bg = "#fd5e3a", italic = true },

                    ["@neorg.links.location.definition.norg"] = { fg = "#fa7a61", bold = true, italic = true, underline = true },
                    ["@neorg.links.location.footnote.norg"] = { fg = "#35b5ff", bold = true, italic = true, underline = true },

                    ["@neorg.definitions.title.norg"] = { fg = "#fa7a61", bold = true, italic = true, underline = true },
                    ["@neorg.footnotes.title.norg"] = { fg = "#35b5ff", bold = true, italic = true, underline = true },

                    ["@neorg.links.location.heading.1.norg"] = { fg = "#000000", bg = "#fd5e3a", bold = true, italic = true },
                    ["@neorg.links.location.heading.2.norg"] = { fg = "#000000", bg = "#35b5ff", bold = true, italic = true },
                    ["@neorg.links.location.heading.3.norg"] = { fg = "#000000", bg = "#fd5e3a", bold = true, italic = true },
                    ["@neorg.links.location.heading.4.norg"] = { fg = "#000000", bg = "#fd5e3a", bold = true, italic = true },
                    ["@neorg.links.location.heading.5.norg"] = { fg = "#000000", bg = "#fd5e3a", bold = true, italic = true },
                    ["@neorg.links.location.heading.6.norg"] = { fg = "#000000", bg = "#fd5e3a", bold = true, italic = true },

                    ["@neorg.headings.1.title.norg"] = { fg = "#000000", bg = "#fd5e3a", bold = true, italic = true },
                    ["@neorg.headings.2.title.norg"] = { fg = "#000000", bg = "#35b5ff", bold = true, italic = true },
                    ["@neorg.headings.3.title.norg"] = { fg = "#000000", bg = "#fd5e3a", bold = true, italic = true },
                    ["@neorg.headings.4.title.norg"] = { fg = "#000000", bg = "#fd5e3a", bold = true, italic = true },
                    ["@neorg.headings.5.title.norg"] = { fg = "#000000", bg = "#fd5e3a", bold = true, italic = true },
                    ["@neorg.headings.6.title.norg"] = { fg = "#000000", bg = "#fd5e3a", bold = true, italic = true },
                },
            })

            vim.cmd.colorscheme("neofusion")

            require("lualine").setup({
                options = {
                    theme = require("neofusion.lualine"),
                },
            })
        end,
    },
}
