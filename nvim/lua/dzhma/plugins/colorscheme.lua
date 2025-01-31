return {
    -- {
    --     'EtiamNullam/white-chocolate.nvim',
    --     priority = 1000,
    --     config = function()
    --         require('white-chocolate').setup()
    --         vim.api.nvim_set_hl(0, "@markup.strong.markdown_inline", { fg = "#1aa7d6", bold = true })
    --         vim.api.nvim_set_hl(0, "@markup.italic.markdown_inline", { fg = "#69b98b", italic = true })
    --     end,
    -- },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        dependencies = {
            "nvim-lualine/lualine.nvim",
        },
        config = function ()
            require("lualine").setup({
                options = {
                    theme = "auto"
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
                        { fg = "#ff0000" },
                        { fg = "#ff0000" },
                    },
                    delay = 0,
                    duration = 0,
                },
                indent = {
                    enable = true,
                },
                line_num = {
                    enable = true,
                    style = "#ff0000",
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
