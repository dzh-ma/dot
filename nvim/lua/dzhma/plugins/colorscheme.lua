return {
    -- DOCS: Main color-scheme
    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --     dependencies = {
    --         "nvim-lualine/lualine.nvim",
    --     },
    --     config = function ()
    --         require("catppuccin").setup({
    --             flavour = "mocha",      -- latte, frappe, macchiato, mocha
    --             styles = {
    --                 variables = { "italic" },
    --             },
    --             integrations = {
    --                 notify = true,
    --                 aerial = true,
    --                 mason = true,
    --                 noice = true,
    --                 hop = true,
    --                 markdown = true,
    --                 indent_blankline = {
    --                     enabled = true,
    --                     scope_color = "mauve",
    --                     colored_indetn_levels = true,
    --                 }
    --             },
    --             custom_highlights = function(colors)
    --                 return {
    --                     ["@neorg.markup.inline_math.norg"] = { fg = colors.flamingo },
    --                     ["@markup.quote.markdown"] = { fg = colors.mauve },
    --                 }
    --             end,
    --         })
    --
    --         require("lualine").setup({
    --            themes = "catpuccin"
    --         })
    --
    --         vim.cmd.colorscheme("catppuccin");
    --     end
    -- },
    {
        'Verf/deepwhite.nvim',
        lazy = false,
        dependencies = {
            "nvim-lualine/lualine.nvim",
        },
        priority = 1000,
        config = function()
            require('deepwhite').setup({
                -- If you have some anti-blue light setting (f.lux, light bulb, or low blue light mode monitor),
                -- turn it on, this will set the background color to a cooler color to prevent the background from being too warm.
                low_blue_light = true
            })

            -- for lualine
            require('lualine').setup({
                options = {
                    theme = 'deepwhite',
                },
            })

            vim.cmd.colorscheme("deepwhite");
        end,
    },

    -- DOCS: Distinctly colored parentheses
    -- {
    --     "HiPhish/rainbow-delimiters.nvim",
    --     event = { "BufReadPre", "BufNewFile" },
    --     dependencies = { "nvim-treesitter/nvim-treesitter" },
    -- },
}
