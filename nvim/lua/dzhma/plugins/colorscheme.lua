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
                },
                custom_highlights = function(colors)
                    return {
                        ["@neorg.markup.inline_math.norg"] = { fg = colors.flamingo },
                        ["@markup.quote.markdown"] = { fg = colors.mauve },
                    }
                end
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

    -- DOCS: Shows active & inactive buffers
    {
        "tomiis4/BufferTabs.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional
        },
        lazy = false,
        config = function()
            require("buffertabs").setup({
                --- @type 'single'|'double'|'rounded'|'solid'|'shadow'|table
                border = "solid",

                --- @type integer
                padding = 1,

                --- @type string
                modified = " ",

                --- @type 'row'|'column'
                display = "column",

                --- @type 'left'|'right'|'center'
                horizontal = "right",

                --- @type 'top'|'bottom'|'center'
                vertical = "top",
            })

            vim.keymap.set("n", "<Leader>h", "<cmd>BufferTabsToggle<CR>", { silent = true, desc = "BufferTabs: Toggle visibility" })
        end
    },
}
