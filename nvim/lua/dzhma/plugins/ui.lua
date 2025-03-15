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

    -- DOCS: Movement buff
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
}
