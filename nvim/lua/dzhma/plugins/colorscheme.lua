return {
    {
        'uncleTen276/dark_flat.nvim',
        config = function ()
            require("dark_flat").setup({
                transparent = true,
                themes = function (colors)
                    return {
                        ["@markup.strong"] = { fg = colors.dark_red, bold = true },
                        ["@markup.italic"] = { fg = colors.light_yellow, italic = true },
                        ["@neorg.markup.underline.norg"] = { fg = colors.green, bold = true, underline = true },
                        ["@neorg.markup.strikethrough.norg"] = { fg = colors.aqua, bold = true },
                        ["@neorg.markup.subscript.norg"] = { bg = colors.dark_gray, fg = colors.red, italic = true },
                        ["@neorg.markup.superscript.norg"] = { bg = colors.dark_gray, fg = colors.dark_cyan, italic = true },
                        ["@neorg.markup.verbatim.norg"] = { fg = colors.peanut, bg = colors.dark_gray },
                        ["@neorg.markup.variable.norg"] = { fg = colors.white, bold = true, underline = true },
                        ["@neorg.markup.inline_math.norg"] = { fg = colors.dark_pink, bg = colors.gray, bold = true },
                        ["@operator.latex"] = { fg = colors.dark_pink },
                        ["@markup.heading.1.markdown"] = { fg = "#FF0000", bg = "#400000", bold = true },
                        ["@markup.heading.2.markdown"] = { fg = "#FFD700", bg = "#5B4A08", bold = true },
                        ["@markup.heading.3.markdown"] = { fg = "#7CFC00", bg = "#013220", bold = true },
                        ["@markup.heading.4.markdown"] = { fg = "#40E0D0", bg = "#065465", bold = true },
                        ["@markup.heading.5.markdown"] = { fg = "#FF8C00", bg = "#B03608", bold = true },
                        ["@markup.heading.6.markdown"] = { fg = "#9370DB", bg = "#301934", bold = true },
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
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
