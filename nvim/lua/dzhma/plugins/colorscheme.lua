return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "tamton-aquib/staline.nvim",
        },
        config = function ()
            require("catppuccin").setup({
                styles = {
                    variables = { "italic" },
                }
            })

            --require("lualine").setup({
            --    themes = "catpuccin"
            --})

            require("staline").setup({
                mode_colors = {
                    i = "#a6e3a1",
                    n = "#f5c2e7",
                    c = "#f38ba8",
                    v = "#94e2d5",
                },
            })

            require('stabline').setup {
                style       = "bar", -- others: arrow, slant, bubble, bar
                stab_left   = "",
                stab_right  = "",

                -- fg       = Default is fg of "Normal".
                -- bg       = Default is bg of "Normal".
                inactive_bg = "#1e1e2e",
                inactive_fg = "#555555",
                stab_bg     = "#1e1e2e",

                font_active = "bold",
                stab_start  = "",   -- The starting of stabline
                stab_end    = "",
            }

            vim.cmd.colorscheme("catppuccin");
        end
    },
}
