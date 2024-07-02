return {
    {
        -- UI overhaul
        'folke/noice.nvim',
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify"},
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                presets = {
                    -- you can enable a preset by setting it to true, or a table that will override the preset config
                    -- you can also add custom presets that you can enable/disable with enabled=true
                    bottom_search = false, -- use a classic bottom cmdline for search
                    command_palette = false, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                },
                views = {
                    cmdline_popup = {
                        border = {
                            style = "none",
                            padding = { 1, 1 },
                        },
                        win_options = {
                            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                        },
                    },
                },
            })

            require("notify").setup({
                background_colour = "#000000",
                render = "minimal",
                timeout = 0,
            })
        end,
    },

    {
        -- Git information integration
        'lewis6991/gitsigns.nvim',
        event = "VeryLazy",
        config = function()
            require('gitsigns').setup({
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "-" },
                    topdelete = { text = "▔" },
                    changedelete = { text = "≃" },
                    untracked = { text = "?" },
                }
            })
        end,
    },

    {
        -- icon pack 1
        'ryanoasis/vim-devicons',
        event = "VeryLazy",
    },

    {
        -- icon pack 2
        'nvim-tree/nvim-web-devicons',
        event = "VeryLazy",
        config = function()
            vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
            vim.g.WebDevIconsUnicodeDecorateFileNodes = 1
            vim.g.WebDevIconsUnicodeDecorateOpenFolderNodes = 1
            vim.g.WebDevIconsUnicodeDecorateDefault = 0
        end,
    },
}
