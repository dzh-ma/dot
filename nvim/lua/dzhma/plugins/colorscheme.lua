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
                        ["MarkviewHeading1Sign"] = { fg = "#FF0000" },
                        ["MarkviewHeading2Sign"] = { fg = "#FF0000" },
                        ["MarkviewHeading3Sign"] = { fg = "#FF0000" },
                        ["MarkviewHeading4Sign"] = { fg = "#FF0000" },
                        ["MarkviewHeading5Sign"] = { fg = "#FF0000" },
                        ["MarkviewHeading6Sign"] = { fg = "#FF0000" },
                        ["MarkviewHeading1"] = { fg = "#FF0000", bg = "#400000", bold = true, italic = true },  -- Gold
                        ["MarkviewHeading2"] = { fg = "#FFD700", bg = "#5B4A08", bold = true, italic = true },  -- Gold
                        ["MarkviewHeading4"] = { fg = "#7CFC00", bg = "#013220", bold = true, italic = true },  -- LawnGreen
                        ["MarkviewHeading6"] = { fg = "#40E0D0", bg = "#065465", bold = true, italic = true },  -- Turquoise
                        ["MarkviewHeading8"] = { fg = "#FF8C00", bg = "#B03608", bold = true, italic = true },  -- DarkOrange
                        ["MarkviewHeading10"] = { fg = "#9370DB", bg = "#301934", bold = true, italic = true},   -- MediumPurple
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
