return {
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "justinhj/battery.nvim",
            "archibate/lualine-time",
            "chrisgrieser/nvim-dr-lsp",
        },
        config = function ()
            require("battery").setup({})

            local nvimbattery = {
                function()
                    return require("battery").get_status_line()
                end,
            }

            require("dr-lsp").setup({
                highlightCursorWordReferences = {
                    enable = true,
                },
            })

            require("lualine").setup({
                options = {
                    theme = "auto"
                },
                sections = {
                    lualine_a = nvimbattery,
                    lualine_c = { require("dr-lsp").lspCount },
                    lualine_z = {
                        "cdate",
                        "ctime",
                    },
                },
            })

            vim.cmd.colorscheme "cyberdream"
        end,
    },

    {
        "shellRaining/hlchunk.nvim",
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        config = function()
            require("hlchunk").setup({
                chunk = {
                    enable = true,
                    style = {
                        { fg = "#ffffff" },
                        { fg = "#ffffff" },
                    },
                    delay = 0,
                    duration = 0,
                },
                indent = {
                    enable = false,
                },
                line_num = {
                    enable = true,
                    style = "#ffffff",
                }
            })
        end
    },

    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
