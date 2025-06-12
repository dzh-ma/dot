return {
    {
        "uncleTen276/dark_flat.nvim",
        config = function ()
            require("dark_flat").setup({
                transparent = true,

                themes = function (colors)
                    return {
                        Normal = { fg = "#FFFFFF" },
                        -- typst
                        ["@markup.strong.typst"] = { fg = "#FFA500", bold = true },
                        ["@markup.italic.typst"] = { fg = "#00FFFF", italic = true },
                        ["@markup.heading.typst"] = { fg = "#FFFF00", underline = true, bold = true },
                        ["@markup.raw.block.typst"] = { link = "Normal" },

                        -- markdown
                        ["@markup.heading.1.markdown"] = { fg = "#FF4500", bg = "#2B1C17", bold = true }, -- Heading 1
                        ["@markup.heading.2.markdown"] = { fg = "#FFD700", bg = "#2F2B17", bold = true }, -- Heading 2
                        ["@markup.heading.3.markdown"] = { fg = "#32CD32", bg = "#1C2B1C", bold = true }, -- Heading 3
                        ["@markup.heading.4.markdown"] = { fg = "#00CED1", bg = "#172B2B", bold = true }, -- Heading 4
                        ["@markup.heading.5.markdown"] = { fg = "#9370DB", bg = "#1F1C2B", bold = true }, -- Heading 5
                        ["@markup.heading.6.markdown"] = { fg = "#FF69B4", bg = "#2B1721", bold = true }, -- Heading 6

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
                    }
                end,
            })

            vim.cmd.colorscheme "dark_flat"

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
                    enable = true
                },
            })
        end
    },

    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
