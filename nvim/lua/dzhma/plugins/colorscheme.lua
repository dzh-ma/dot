return {
    -- DOCS: Main color-scheme
    -- {
    --     "0xstepit/flow.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {
    --         colors = {
    --             custom = {
    --                 saturation = "100",
    --             },
    --         },
    --         ui = {
    --             borders = "fluo",
    --         }
    --     },
    --     config = function ()
    --         require("flow").setup(opts)
    --
    --         vim.cmd.colorscheme "flow"
    --     end
    -- },
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 1000,
        config = function ()
            require("nightfox").setup({
                -- options = {
                --     -- Set transparent background if desired, otherwise false to use 'bg' color
                --     transparent = false,
                --     -- Enable terminal colors to use the theme's defined palette
                --     terminal_colors = true,
                --     -- Configure LSP semantic tokens for better highlighting
                --     lsp_semantic_tokens = true,
                --     -- Set comments style (optional)
                --     comments = {
                --         italic = true,
                --     },
                --     -- Affects the visual appearance of the editor's UI components
                --     styles = {
                --         -- You can adjust these based on your preference for bold/italic text
                --         numbers = "none",
                --         strings = "none",
                --         booleans = "none",
                --         properties = "none",
                --         conditionals = "none",
                --         operators = "none",
                --     },
                -- },
                -- Define custom base colors for background and foreground
                -- colors = {
                --     bg = "#1e1d28", -- Mapped from Ghostty 'background'
                --     fg = "#FFFFFF", -- Mapped from Ghostty 'foreground'
                -- },
                -- Define the full color palette (base and bright ANSI colors)
                palettes = {
                    duskfox = {
                        bg1 = "#1e1d28",
                        -- Base ANSI Colors (0-7 from Ghostty)
                        black = "#131218",   -- Ghostty palette 0
                        red = "#ff8368",     -- Ghostty palette 1
                        green = "#95ff68",   -- Ghostty palette 2
                        yellow = "#ffe068",  -- Ghostty palette 3
                        cyan = "#68ffeb",    -- Ghostty palette 4 (most cyan-like)
                        magenta = "#e068ff", -- Ghostty palette 5
                        blue = "#8368ff",    -- Ghostty palette 6 (most blue-like)
                        white = "#fbfaf5",   -- Ghostty palette 7

                        -- Bright ANSI Colors (8-15 from Ghostty)
                        bright_black = "#3c3a53",    -- Ghostty palette 8
                        bright_red = "#ffccc2",      -- Ghostty palette 9
                        bright_green = "#d4ffc2",    -- Ghostty palette 10
                        bright_yellow = "#ffb068",   -- Ghostty palette 11
                        bright_blue = "#68ffeb",     -- Ghostty palette 12 (same as base cyan, consistent with Ghostty)
                        bright_magenta = "#ff68b0",  -- Ghostty palette 13
                        bright_cyan = "#ffc2e1",     -- Ghostty palette 14 (closest to bright cyan in Ghostty)
                        bright_white = "#FFFFFF",    -- Ghostty palette 15

                        -- Additional colors for common highlight groups
                        -- Derived from Ghostty's palette, choosing what fits best
                        orange = "#ffb068", -- Using bright_yellow as the orange
                        pink = "#ff68b0",   -- Using bright_magenta as the pink
                    },
                },
                -- Customize specific highlight groups
                -- highlights = {
                --     -- Cursor colors
                --     -- Background is Ghostty's 'cursor-color', foreground contrasts with it (using Ghostty's background)
                --     Cursor = { bg = "#ff68b0", fg = "#1e1d28" },
                --     -- Selection background
                --     Visual = { bg = "#272535" }, -- Mapped from Ghostty 'selection-background'
                -- }
            })

            vim.cmd.colorscheme "duskfox"
        end
    },

    -- DOCS: Distinctly colored parentheses
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    -- {
    --     "tomiis4/BufferTabs.nvim",
    --     dependencies = {
    --         "nvim-tree/nvim-web-devicons", -- optional
    --     },
    --     lazy = false,
    --     config = function()
    --         require("buffertabs").setup()
    --     end
    -- },
}
