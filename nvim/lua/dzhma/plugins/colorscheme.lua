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
                        ["@markup.heading.1.markdown"] = { fg = "#FF0000", bg = "#400000", bold = true },  -- Gold ["@markup.heading.2.markdown"] = { fg = "#FFD700", bg = "#5B4A08", bold = true, italic = true },  -- Gold
                        ["@markup.heading.2.markdown"] = { fg = "#FFD700", bg = "#5B4A08", bold = true },  -- Gold
                        ["@markup.heading.3.markdown"] = { fg = "#7CFC00", bg = "#013220", bold = true },  -- LawnGreen
                        ["@markup.heading.4.markdown"] = { fg = "#40E0D0", bg = "#065465", bold = true },  -- Turquoise
                        ["@markup.heading.5.markdown"] = { fg = "#FF8C00", bg = "#B03608", bold = true },  -- DarkOrange
                        ["@markup.heading.6.markdown"] = { fg = "#9370DB", bg = "#301934", bold = true },   -- MediumPurple
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
                        ["@markup.math.latex"] = { fg = "#E31C79" },
                    }
                end,
            })

            vim.cmd.colorscheme('dark_flat')
        end,
    },

    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
