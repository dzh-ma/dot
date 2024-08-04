return {
    {
        url = "https://codeberg.org/jthvai/lavender.nvim",
        config = function ()
            vim.g.lavender = {
                transparent = {
                    background = true,
                    float = true,
                    popup = true,
                    sidebar = true,
                },
                overrides = {
                    theme = {
                        ['@markup.italic'] = { fg = "cyan", italic = true },
                        ['@markup.strong'] = { fg = "yellow", bold = true },
                        ['@markup.list.checked.markdown'] = { fg = "green", bold = true },
                        ['@markup.list.unchecked.markdown'] = { fg = "red", bold = true },
                        asciidocMacro = { fg = "#000000", bg = "Blue" },
                        asciidocMacroAttributes = { fg = "#000000", bg = "pink"  },
                        asciidocAnchorMacro = { fg = "#000000", bg = "cyan" },
                    }
                }
            }

            vim.cmd.colorscheme('lavender')
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
