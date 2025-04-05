return {
    -- DOCS: Main color-scheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        dependencies = {
            "nvim-lualine/lualine.nvim",
        },
        config = function ()
            require("catppuccin").setup({
                flavour = "mocha",      -- latte, frappe, macchiato, mocha
                styles = {
                    variables = { "italic" },
                },
                integrations = {
                    notify = true,
                    aerial = true,
                    mason = true,
                    noice = true,
                    hop = true,
                    render_markdown = true,
                    indent_blankline = {
                        enabled = true,
                        scope_color = "mauve",
                        colored_indent_levels = true,
                    },
                    rainbow_delimiters = true,
                },
                custom_highlights = function(colors)
                    return {
                        ["@neorg.markup.inline_math.norg"] = { fg = colors.flamingo },
                        ["@markup.quote.markdown"] = { fg = colors.mauve },
                    }
                end,
            })

            require("lualine").setup({
               themes = "catpuccin"
            })

            vim.cmd.colorscheme("catppuccin");
        end
    },

    -- DOCS: Distinctly colored parentheses
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
