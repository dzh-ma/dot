return {
    {
        -- UI overhaul
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

            vim.keymap.set("n", "<A-n>", "<cmd>Noice<CR>", { noremap = true, silent = true })

            require("notify").setup({
                background_colour = "#000000",
                render = "minimal",     -- default/minimal/simple/compact/wrapped-compact/wrapped-default
                stages = "slide",       -- fade_in_slide_out/fade/slide/static
                timeout = 0,
                max_width = 30,
                top_down = true,
            })
        end,
    },

    {
        -- Git information integration
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup({
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

    {
        "Bekaboo/dropbar.nvim",
        -- optional, but required for fuzzy finder support
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        },
        config = function()
            local dropbar_api = require("dropbar.api")

            vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
            vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
            vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
        end,
    },

    {
        "isakbm/gitgraph.nvim",
        opts = {
            format = {
                timestamp = "%H:%M:%S %d-%m-%Y",
                fields = { "hash", "timestamp", "author", "branch_name", "tag" },
            },
            hooks = {
                on_select_commit = function(commit)
                    print("selected commit:", commit.hash)
                end,
                on_select_range_commit = function(from, to)
                    print("selected range:", from.hash, to.hash)
                end,
            },
            symbols = {
                merge_commit = "",
                commit = "",
                merge_commit_end = "",
                commit_end = "",

                -- Advanced symbols
                GVER = "",
                GHOR = "",
                GCLD = "",
                GCRD = "╭",
                GCLU = "",
                GCRU = "",
                GLRU = "",
                GLRD = "",
                GLUD = "",
                GRUD = "",
                GFORKU = "",
                GFORKD = "",
                GRUDCD = "",
                GRUDCU = "",
                GLUDCD = "",
                GLUDCU = "",
                GLRDCL = "",
                GLRDCR = "",
                GLRUCL = "",
                GLRUCR = "",
            },
        },
        keys = {
            {
                "<leader>gl",
                function()
                    require("gitgraph").draw({}, { all = true, max_count = 5000 })
                end,
                desc = "GitGraph - Draw",
            },
        },
    },
}
