return {
    {
        'uncleTen276/dark_flat.nvim',
        config = function ()
            require("dark_flat").setup({
                transparent = true,
                themes = function (colors)
                    return {
                        -- general
                        ["@variable"] = { fg = "#41FDFE", bold = true },
                        ["Structure"] = { fg = colors.dark_cyan },
                        ["Function"] = { fg = "#0ADD08", underline = true },
                        ["LineNr"] = { fg = "#FF0000" },
                        ["String"] = { fg = "#FFFF00" },
                        ["Keyword"] = { fg = "#FF0000" },

                        -- git
                        ["GitSignsAdd"] = { fg = "#FF0000" },
                        ["GitSignsChange"] = { fg = "#FF0000" },
                        ["GitSignsDelete"] = { fg = "#FF0000" },
                        ["GitSignsTopdelete"] = { fg = "#FF0000" },
                        ["GitSignsChangedelete"] = { fg = "#FF0000" },
                        ["GitSignsUntracked"] = { fg = "#FF0000" },

                        -- general markup
                        ["@markup.strong"] = { fg = "#FF0000", bold = true },
                        ["@markup.italic"] = { fg = "#FFFF00", italic = true },

                        -- neorg headings
                        ["@neorg.headings.1.title.norg"] = { fg = "#FF0000", bg = "#400000", bold = true, italic = true },
                        ["@neorg.headings.2.title.norg"] = { fg = "#FFD700", bg = "#5B4A08", bold = true, italic = true },
                        ["@neorg.headings.3.title.norg"] = { fg = "#7CFC00", bg = "#013220", bold = true, italic = true },
                        ["@neorg.headings.4.title.norg"] = { fg = "#40E0D0", bg = "#065465", bold = true, italic = true },
                        ["@neorg.headings.5.title.norg"] = { fg = "#FF8C00", bg = "#B03608", bold = true, italic = true },
                        ["@neorg.headings.6.title.norg"] = { fg = "#9370DB", bg = "#301934", bold = true, italic = true },
                        ["@neorg.headings.1.prefix.norg"] = { fg = "#FF0000", bg = "#400000", bold = true, italic = true },
                        ["@neorg.headings.2.prefix.norg"] = { fg = "#FFD700", bg = "#5B4A08", bold = true, italic = true },
                        ["@neorg.headings.3.prefix.norg"] = { fg = "#7CFC00", bg = "#013220", bold = true, italic = true },
                        ["@neorg.headings.4.prefix.norg"] = { fg = "#40E0D0", bg = "#065465", bold = true, italic = true },
                        ["@neorg.headings.5.prefix.norg"] = { fg = "#FF8C00", bg = "#B03608", bold = true, italic = true },
                        ["@neorg.headings.6.prefix.norg"] = { fg = "#9370DB", bg = "#301934", bold = true, italic = true },

                        -- neorg links
                        ["@neorg.links.location.heading.1.norg"] = { fg = "#FF0000", bg = "#400000", bold = true, italic = true },
                        ["@neorg.links.location.heading.2.norg"] = { fg = "#FFD700", bg = "#5B4A08", bold = true, italic = true },
                        ["@neorg.links.location.heading.3.norg"] = { fg = "#7CFC00", bg = "#013220", bold = true, italic = true },
                        ["@neorg.links.location.heading.4.norg"] = { fg = "#40E0D0", bg = "#065465", bold = true, italic = true },
                        ["@neorg.links.location.heading.5.norg"] = { fg = "#FF8C00", bg = "#B03608", bold = true, italic = true },
                        ["@neorg.links.location.heading.6.norg"] = { fg = "#9370DB", bg = "#301934", bold = true, italic = true },
                        ["@neorg.anchors.declaration.norg"] = { fg = "#000000", bg = "#00FFFF", bold = true },
                        ["@neorg.anchors.definition.delimiter.norg"] = { bg = "#00FFFF" },
                        ["@neorg.links.location.url.norg"] = { fg = colors.dark_gray },

                        -- neorg markup
                        ["@neorg.markup.bold.norg"] = { fg = "#FF0000", bg = "#770000", bold = true },
                        ["@neorg.markup.italic.norg"] = { fg = "#00FF00", bg = "#007700", italic = true },
                        ["@neorg.markup.underline.norg"] = { fg = "#00FFFF", bg = "#007777", underline = true },
                        ["@neorg.markup.strikethrough.norg"] = { fg = "#8B0000", bg = "#660000", strikethrough = true, bold = true },
                        ["@neorg.markup.verbatim.norg"] = { fg = "#FFFF00", bg = "#4B0082" },
                        ["@neorg.markup.inline_math.norg"] = { fg = "#FF69B4", bg = "#CC5490", bold = true },
                        ["@neorg.markup.superscript.norg"] = { fg = "#FFC0CB", bg = "#CC99A1" },
                        ["@neorg.markup.subscript.norg"] = { fg = "#8A2BE2", bg = "#2A0134" },
                        ["@neorg.markup.variable.norg"] = { fg = "#FFA500", bg = "#8B4000", bold = true, italic = true },
                        --["@neorg.markup.spoiler.norg"] = { bg = "#708090" },                   -- SlateGray

                        -- neorg quotes
                        ["@neorg.quotes.1.content.norg"] = { fg = "#FF6347" },                 -- Tomato
                        ["@neorg.quotes.2.content.norg"] = { fg = "#32CD32" },                 -- LimeGreen
                        ["@neorg.quotes.3.content.norg"] = { fg = "#FF1493" },                 -- DeepPink (changed from DarkOrchid)
                        ["@neorg.quotes.4.content.norg"] = { fg = "#00FA9A" },                 -- MediumSpringGreen (changed from DeepPink)
                        ["@neorg.quotes.5.content.norg"] = { fg = "#20B2AA" },                 -- LightSeaGreen
                        ["@neorg.quotes.6.content.norg"] = { fg = "#8B4513" },                 -- SaddleBrown
                        ["@neorg.quotes.1.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        ["@neorg.quotes.2.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        ["@neorg.quotes.3.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        ["@neorg.quotes.4.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        ["@neorg.quotes.5.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        ["@neorg.quotes.6.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },

                        -- neorg modifiers
                        ["@neorg.tags.ranged_verbatim.begin.norg"] = { fg = "#964B00", bg = "#5C4033", bold = true, italic = true },
                        ["@neorg.tags.ranged_verbatim.end.norg"] = { fg = "#964B00", bg = "#5C4033", bold = true, italic = true },
                        ["@neorg.tags.ranged_verbatim.name.word.norg"] = { fg = "#964B00", bg = "#5C4033", bold = true, italic = true},
                        ["@neorg.tags.ranged_verbatim.parameters.word.norg"] = { fg = "#66FF00", bold = true, italic = true},
                        ["@neorg.lists.ordered.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        ["@neorg.lists.unordered.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },

                        -- neorg todo
                        ["@neorg.todo_items.undone.norg"] = { fg = "#FF0000", bg = "#5B4513" },
                        ["@neorg.todo_items.done.norg"] = { fg = "#00FF00", bg = "#5B4513" },
                        ["@neorg.todo_items.pending.norg"] = { fg = "#00FFFF", bg = "#5B4513" },
                        ["@neorg.todo_items.uncertain.norg"] = { fg = "#0000FF", bg = "#5B4513" },
                        ["@neorg.todo_items.urgent.norg"] = { fg = "#FFFF00", bg = "#5B4513" },
                        ["@neorg.todo_items.recurring.norg"] = { fg = "#341709", bg = "#5B4513" },
                        ["@neorg.todo_items.on_hold.norg"] = { fg = "#FFFFFF", bg = "#5B4513" },
                        ["@neorg.todo_items.cancelled.norg"] = { fg = "#000000", bg = "#5B4513" },
                    }
                end,
            })

            vim.cmd.colorscheme('dark_flat')
        end,
    },

    --{
    --    "lukas-reineke/indent-blankline.nvim",
    --    event = { "BufReadPre", "BufNewFile" },
    --    main = "ibl",
    --    config = function()
    --        require("ibl").setup({})
    --    end
    --},
}
