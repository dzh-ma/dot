return {
    {
        'uncleTen276/dark_flat.nvim',
        config = function ()
            require("dark_flat").setup({
                transparent = true,
                themes = function (colors)
                    return {
                        ["@markup.strong"] = { fg = "#FF0000", bold = true },
                        ["@markup.italic"] = { fg = "#FFFF00", italic = true },
                        ["@variable"] = { fg = "#41FDFE", bold = true },
                        ["Structure"] = { fg = colors.dark_cyan },
                        ["Function"] = { fg = "#0ADD08", underline = true },
                        ["LineNr"] = { fg = "#FF0000" },
                        ["String"] = { fg = "#FFFF00" },
                        ["Keyword"] = { fg = "#FF0000" },
                        ["GitSignsAdd"] = { fg = "#FF0000" },
                        ["GitSignsChange"] = { fg = "#FF0000" },
                        ["GitSignsDelete"] = { fg = "#FF0000" },
                        ["GitSignsTopdelete"] = { fg = "#FF0000" },
                        ["GitSignsChangedelete"] = { fg = "#FF0000" },
                        ["GitSignsUntracked"] = { fg = "#FF0000" },
                        ["@neorg.headings.1.title.norg"] = { fg = "#FF0000", bg = "#400000", bold = true, italic = true, underline = true },  -- Gold
                        ["@neorg.headings.2.title.norg"] = { fg = "#FFD700", bg = "#5B4A08", bold = true, italic = true, underline = true },  -- LawnGreen
                        ["@neorg.headings.3.title.norg"] = { fg = "#7CFC00", bg = "#013220", bold = true, italic = true, underline = true },  -- Turquoise
                        ["@neorg.headings.4.title.norg"] = { fg = "#40E0D0", bg = "#065465", bold = true, italic = true, underline = true },  -- DarkOrange
                        ["@neorg.headings.5.title.norg"] = { fg = "#FF8C00", bg = "#B03608", bold = true, italic = true, underline = true },   -- MediumPurple
                        ["@neorg.headings.6.title.norg"] = { fg = "#9370DB", bg = "#301934", bold = true, italic = true, underline = true },  -- DarkTurquoise
                        ["@neorg.links.location.heading.1.norg"] = { fg = "#FF0000", bg = "#400000", bold = true, italic = true },
                        ["@neorg.links.location.heading.2.norg"] = { fg = "#FFD700", bg = "#5B4A08", bold = true, italic = true },
                        ["@neorg.links.location.heading.3.norg"] = { fg = "#7CFC00", bg = "#013220", bold = true, italic = true },
                        ["@neorg.links.location.heading.4.norg"] = { fg = "#40E0D0", bg = "#065465", bold = true, italic = true },
                        ["@neorg.links.location.heading.5.norg"] = { fg = "#FF8C00", bg = "#B03608", bold = true, italic = true },
                        ["@neorg.links.location.heading.6.norg"] = { fg = "#9370DB", bg = "#301934", bold = true, italic = true },
                        ["@neorg.markup.bold.norg"] = { fg = "#FF0000", bg = "#770000", bold = true },         -- Red
                        ["@neorg.markup.italic.norg"] = { fg = "#00FF00", bg = "#007700", italic = true },     -- BlueViolet (unchanged)
                        ["@neorg.markup.underline.norg"] = { fg = "#00FFFF", bg = "#007777", underline = true }, -- Cyan
                        ["@neorg.markup.strikethrough.norg"] = { fg = "#8B0000", bg = "#660000", strikethrough = true, bold = true }, -- DodgerBlue
                        ["@neorg.markup.verbatim.norg"] = { fg = "#FFFF00", bg = "#4B0082" },  -- Yellow on Indigo
                        ["@neorg.markup.inline_math.norg"] = { fg = "#FF69B4", bg = "#CC5490", bold = true },               -- HotPink
                        ["@neorg.markup.superscript.norg"] = { fg = "#FFC0CB", bg = "#CC99A1" },                 -- RoyalBlue
                        ["@neorg.markup.subscript.norg"] = { fg = "#8A2BE2", bg = "#6A1CB2" },                 -- RoyalBlue
                        ["@neorg.markup.variable.norg"] = { fg = "#FFA500", bg = "#CC8400", bold = true, italic = true }, -- Orange
                        --["@neorg.markup.spoiler.norg"] = { bg = "#708090" },                   -- SlateGray
                        ["@neorg.quotes.1.content.norg"] = { fg = "#FF6347" },                 -- Tomato
                        ["@neorg.quotes.2.content.norg"] = { fg = "#32CD32" },                 -- LimeGreen
                        ["@neorg.quotes.3.content.norg"] = { fg = "#FF1493" },                 -- DeepPink (changed from DarkOrchid)
                        ["@neorg.quotes.4.content.norg"] = { fg = "#00FA9A" },                 -- MediumSpringGreen (changed from DeepPink)
                        ["@neorg.quotes.5.content.norg"] = { fg = "#20B2AA" },                 -- LightSeaGreen
                        ["@neorg.quotes.6.content.norg"] = { fg = "#8B4513" },                 -- SaddleBrown
                        ["@neorg.anchors.norg"] = { underline = true, },
                        ["@neorg.anchors.declaration.norg"] = { fg = colors.light_green },
                        ["@neorg.links.location.url.norg"] = { fg = colors.dark_gray },
                        ["@neorg.tags.ranged_verbatim.begin.norg"] = { fg = "#964B00", bold = true, italic = true },
                        ["@neorg.tags.ranged_verbatim.end.norg"] = { fg = "#964B00", bold = true, italic = true },
                        ["@neorg.tags.ranged_verbatim.name.word.norg"] = { fg = "#964B00", bold = true, italic = true},
                        ["@neorg.tags.ranged_verbatim.parameters.word.norg"] = { fg = "#66FF00", bold = true, italic = true},
                    }
                end,
            })

            vim.cmd.colorscheme('dark_flat')
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
