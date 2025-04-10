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
    -- {
    --     "rachartier/tiny-inline-diagnostic.nvim",
    --     event = "VeryLazy", -- Or `LspAttach`
    --     priority = 1000, -- needs to be loaded in first
    --     config = function()
    --         require("tiny-inline-diagnostic").setup({
    --             preset = "ghost",
    --         })
    --         vim.diagnostic.config({virtual_text = false})
    --     end
    -- },

    -- DOCS: Indentation
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function ()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowPink",
                "RainbowGreen",
                "RainbowMagenta",
                "RainbowCyan",
            }

            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#d54e53" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#ffc900" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#00b0ff" })
                vim.api.nvim_set_hl(0, "RainbowPink", { fg = "#ee2c68" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#3dd177" })
                vim.api.nvim_set_hl(0, "RainbowMagenta", { fg = "#d03770" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#64fcda" })
            end)

            require("ibl").setup { indent = { highlight = highlight } }
        end,
        opts = {}
    },


    -- DOCS: Bufferline
    -- {
    --     "willothy/nvim-cokeline",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
    --         "nvim-tree/nvim-web-devicons", -- If you want devicons
    --         "stevearc/resession.nvim"       -- Optional, for persistent history
    --     },
    --     config = function ()
    --         require("cokeline").setup({
    --             buffers = {
    --                 delete_on_right_click = false,
    --             },
    --             mappings = {
    --                 disable_mouse = true,
    --             },
    --         })
    --     end,
    -- },
}
