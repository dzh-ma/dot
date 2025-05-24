return {
    -- DOCS: Copy-paste support
    {
        "christoomey/vim-system-copy",			        -- enables system yanking & pasting in & out of NeoVim
    },

    -- DOCS: Improved function
    {
        "echasnovski/mini.move",
        version = false,
        config = function()
            require("mini.move").setup({
                mappings = {
                    -- move selection in visual mode
                    left = "<A-C-h>",
                    right = "<A-C-l>",
                    up = "<A-C-k>",
                    down = "<A-C-j>",

                    -- move current line in normal mode
                    line_left = "<A-C-h>",
                    line_right = "<A-C-l>",
                    line_up = "<A-C-k>",
                    line_down = "<A-C-j>",
                }
            })
        end,
    },

    -- DOCS: Picker
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "jvgrootveld/telescope-zoxide",
        },
        cmd = "Telescope",
        keys = {
            { "<Space>f", "<cmd>lua require('telescope.builtin').find_files()<CR>", { desc = "Navigate directory" } },
            { "<Space>F", "<cmd>lua require('telescope').extensions.zoxide.list()<CR>", { desc = "Zoxide search" } },
            { "<Space>l", "<cmd>lua require('telescope.builtin').live_grep()<CR>", desc = "Find phrase" },
        },
        config = function()
            local telescope = require("telescope")

            -- load extensions
            telescope.load_extension("fzf")
            telescope.load_extension('zoxide')
        end,
        opts = {
            defaults = {
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "bottom",
                        preview_width = 0.5,
                    },
                    width = 1.0,
                    height = 1.0,
                    preview_cutoff = 120,
                },
                sorting_strategy = "descending",
                winblend = 0,
            },
            extensions = {
                persisted = {
                    layout_config = {
                        prompt_position = "top",
                        width = 0.6,
                        height = 0.5,
                    },
                },
                zoxide = {
                    prompt_title = "[ Walking on the shoulders of TJ ]",
                    mappings = {
                        default = {
                            after_action = function(selection)
                                print("Update to (" .. selection.z_score .. ") " .. selection.path)
                            end
                        },
                        ["<C-s>"] = {
                            before_action = function(selection) print("before C-s") end,
                            action = function(selection)
                                vim.cmd.edit(selection.path)
                            end
                        },
                    },
                },
            },
        }
    },

    -- DOCS: File manager
    {
        "stevearc/oil.nvim",					            -- file manipulation & traversal inside a buffer environment
        event = "VeryLazy",
        config = function()
            require("oil").setup({
                columns = {
                    "icon",
                    "permissions",
                    "size",
                    "mtime",
                },
                delete_to_trash = true,
                skip_confirm_for_simple_edits = false,
                view_options = {
                    show_hidden = true,
            },
            })
            vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
        end,
    },

    -- DOCS: File heading filter
    {
        "stevearc/aerial.nvim",
        event = "VeryLazy",
        keys = { "<A-o>", "<Leader>a", "<Leader>A" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("aerial").setup({
                backends = {
                    ["_"] = { "treesitter" },
                    typst = { "lsp" },
                },

                layout = {
                    max_width = { 100, 0.5 },
                    min_width = 40,
                },

                on_attach = function(bufnr)
                    vim.keymap.set("n", "<Leader>a", "<cmd>AerialNext<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "<Leader>A", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                end,

                filter_kind = false
                --filter_kind = {
                --    "Class",
                --    "Constructor",
                --    "Enum",
                --    "Function",
                --    "Interface",
                --    "Module",
                --    "Method",
                --    "Struct",
                --},
            })
            vim.keymap.set("n", "<A-o>", "<cmd>AerialToggle!<CR>", { noremap = true, silent = true })
        end,
    },

    -- DOCS: Automatic pairing
    {
        "altermo/ultimate-autopair.nvim",
        event={ "InsertEnter","CmdlineEnter" },
        branch="v0.6", --recommended as each new version will have breaking changes
        opts = {},
    },

    -- DOCS: Automatic pairing in markup languages
    {
        "windwp/nvim-ts-autotag",
        event = { "InsertEnter", "CmdlineEnter" },
        config = function ()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close_on_slash = true,
                }
            })
        end
    },

    -- DOCS: Easy parenthesization
    {
        "NStefan002/visual-surround.nvim",
        config = function ()
            require("visual-surround").setup({})
        end
    },

    -- DOCS: Keybind helper
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },

    -- DOCS: Improved marks function
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        config = function ()
            require("marks").setup({})
        end,
    },

    -- DOCS: Comment improvements
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = {
            "VeryLazy",
        },
        keys = {
            { "<Leader>T", "<cmd>TodoTelescope<CR>", desc = "Search all project todos" }
        },
        opts = {
            keywords = {
                BLOCKER = { icon = "󰂭 ", color = "error", alt = { "STOP", "PREVENT" } },
                DEBUG = { icon = " ", color = "test", alt = { "TRACE", "LOG", "DEBUGGING" } },
                DEPRECATED = { icon = " ", color = "error", alt = { "REMOVE", "OLD", "OBSOLETE" } },
                DOCS = { icon = "󱔗 ", color = "hint", alt = { "DOCUMENTATION", "REFERENCE" } },
                FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
                HACK = { icon = " ", color = "warning" },
                IDEA = { icon = " ", color = "hint", alt = { "INSPIRATION", "SUGGESTION" } },
                IMPORTANT = { icon = " ", color = "warning", alt = { "CRITICAL", "ATTENTION" } },
                NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                QUESTION = { icon = " ", color = "hint", alt = { "QUERY", "ASK", "HELP" } },
                REFACTOR = { icon = " ", color = "hint", alt = { "REWRITE", "IMPROVE", "CLEANUP" } },
                REVIEW = { icon = " ", color = "hint", alt = { "CHECK", "INSPECT", "VALIDATE" } },
                TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
                TODO = { icon = " ", color = "info" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
            },
            merge_keywords = true, -- if true, extends the existing keywords instead of replacing them
        }
    },

    -- DOCS: Spell correction
    {
        "kungfusheep/snipe-spell.nvim",
        dependencies = { "leath-dub/snipe.nvim" },
        config = true,
        keys = {
            { "<A-s>", "<cmd>SnipeSpell<cr>", desc = "Snipe Spellchecker" },
        }
    },

    -- DOCS: Buffer navigator
    {
        "j-morano/buffer_manager.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<A-d>", "<cmd>lua require('buffer_manager.ui').toggle_quick_menu()<CR>", desc = "Toggle buffer manager" }
        },
    },

    -- DOCS: Easy jumping to words
    {
        "smoka7/hop.nvim",
        version = "*",
        keys = {
            { "<A-a>", "<cmd>HopWord<CR>", desc = "Hop to a word" },
        },
        opts = {
             keys = "etovxqpdygfblzhckisuran",
        },
    },

    -- DOCS: Time tracker
    {
        "wakatime/vim-wakatime",
        lazy = false,
    },

    -- DOCS: Git manager
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<Leader>g", "<cmd>LazyGit<CR>", desc = "LazyGit" },
        },
    },

    -- DOCS: QoL improvements
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            input = { enabled = true },
        },
    },
}
