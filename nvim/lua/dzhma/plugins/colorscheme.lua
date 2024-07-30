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
                        ['@markup.italic'] = { fg = "Cyan", italic = true },
                        ['@markup.strong'] = { fg = "Red", bold = true },
                        ['@markup.list.checked.markdown'] = { fg = "Green", bold = true },
                        ['@markup.list.unchecked.markdown'] = { fg = "Red", bold = true },
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
            local default_conf = {
                enable = false,
                style = {},
                notify = false,
                priority = 0,
                exclude_filetypes = {
                    aerial = true,
                    dashboard = true,
                    -- some other filetypes
                }
            }
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
