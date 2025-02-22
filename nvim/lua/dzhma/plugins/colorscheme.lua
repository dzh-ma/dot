return {
    -- DOCS: Main color-scheme
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

            local lualine_theme = require("lualine.themes.auto")
            for mode, sections in pairs(lualine_theme) do
                for section, settings in pairs(sections) do
                    if type(settings) == "table" and settings.bg then
                        settings.bg = "#000000"
                    end
                    if section == 'a' or section == 'z' then
                        if settings.fg then
                            settings.fg = "#FFFFFF"
                        end
                    end
                end
            end

            require("lualine").setup({
                options = {
                    theme = lualine_theme
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

            require("cyberdream").setup({
                colors = {
                    -- For a list of colors see `lua/cyberdream/colours.lua`
                    -- Example:
                    bg = "#000000",
                },
            })

            vim.cmd.colorscheme "cyberdream"
        end,
    },

    -- DOCS: Chunk highlighting
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

    -- DOCS: Distinctly colored parentheses
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
