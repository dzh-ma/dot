return {
    {
        -- DOCS: UI overhaul
        "folke/noice.nvim",
        event = { "VeryLazy" },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                    progress = {
                        enabled = false,
                    },
                },
                presets = {
                    bottom_search = false, -- use a classic bottom cmdline for search
                    command_palette = false, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                },
            })

            vim.keymap.set("n", "<A-n>", "<cmd>Telescope notify<CR>", { noremap = true, silent = true })

            require("notify").setup({
                background_colour = "#000000",
                render = "minimal",     -- default/minimal/simple/compact/wrapped-compact/wrapped-default
                stages = "static",       -- fade_in_slide_out/fade/slide/static
                timeout = 200,
                max_width = 30,
                top_down = false,
            })
        end,
    },

    {
        -- DOCS: Git information integration
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup()
        end,
    },

    -- DOCS: Icons
    {
        "nvim-tree/nvim-web-devicons",
        event = "VeryLazy",
        config = function()
            vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
            vim.g.WebDevIconsUnicodeDecorateFileNodes = 1
            vim.g.WebDevIconsUnicodeDecorateOpenFolderNodes = 1
            vim.g.WebDevIconsUnicodeDecorateDefault = 0
        end,
    },

    {
        "echasnovski/mini.nvim",
        version = false,
    },

    -- DOCS: Custom icon colors
    {
        "dgox16/devicon-colorscheme.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    -- DOCS: Clean diagnostics
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy", -- Or `LspAttach`
        priority = 1000, -- needs to be loaded in first
        config = function()
            require("tiny-inline-diagnostic").setup({
                preset = "ghost",
            })
            vim.diagnostic.config({virtual_text = false})
        end
    },

    -- DOCS: Indentation
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function ()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }

            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)

            require("ibl").setup { indent = { highlight = highlight } }
        end,
        opts = {}
    },
}
