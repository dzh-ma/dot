return {
    {
        "christoomey/vim-system-copy",			        -- enables system yanking & pasting in & out of NeoVim
    },

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
            { "<Space>f", "<cmd>lua require('telescope.builtin').find_files()<CR>", desc = "Navigate directory" },
            { "<Space>l", "<cmd>lua require('telescope.builtin').live_grep()<CR>", desc = "Find phrase" },
            -- { "<Space>C", "<cmd>lua require('telescope').extensions.zoxide.list<CR>", { desc = "Zoxide search" } }
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

    {
        "stevearc/aerial.nvim",
        event = "VeryLazy",
        keys = { "<A-a>", "<Leader>a", "<Leader>A" },
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
            vim.keymap.set("n", "<A-a>", "<cmd>AerialToggle!<CR>", { noremap = true, silent = true })
        end,
    },

    {
        "altermo/ultimate-autopair.nvim",
        event={"InsertEnter","CmdlineEnter"},
        branch="v0.6", --recommended as each new version will have breaking changes
        opts = {},
    },

    {
        "NStefan002/visual-surround.nvim",
        config = function ()
            require("visual-surround").setup({})
        end
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        config = function ()
            require("marks").setup({})
        end,
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = {
            "VeryLazy",
        },
        keys = {
            { "<Leader>t", "<cmd>TodoTelescope<CR>", desc = "Search all project todos" }
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

    {
        "hinell/lsp-timeout.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
    },

    {
        "sindrets/diffview.nvim",
        event = { "VeryLazy" },
    },

    {
        "leath-dub/snipe.nvim",
        keys = {
            {"<A-g>", function () require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu"}
        },
        opts = {
            ui = {
                position = "center",
                open_win_override = {
                    title = " ",
                    border = "rounded",
                },
                hints = {
                    dictionary = "aoeuhtns",
                },
            },
        },
    },

    {
        "kungfusheep/snipe-lsp.nvim",
        event = { "VeryLazy" },
        dependencies = { "leath-dub/snipe.nvim" },
        opts = {
            open_symbols_menu = "<leader>ds",
            open_symbols_menu_for_split = "<leader>sds",
            open_symbols_menu_for_vsplit = "<leader>vds",
        },
    },

    {
        "kungfusheep/snipe-spell.nvim",
        dependencies = { "leath-dub/snipe.nvim" },
        config = true,
        keys = {
            { "<Leader>S", "<cmd>SnipeSpell<cr>", desc = "Snipe Spellchecker" },
        }
    },

    {
        "ThePrimeagen/harpoon",
        event = { "VeryLazy" },
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function ()
            local harpoon = require("harpoon")
            harpoon:setup()

            vim.keymap.set("n", "<A-s>", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-s>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<A-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<A-j>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<A-k>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<A-l>", function() harpoon:list():select(4) end)

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "<Leader><S-P>", function() harpoon:list():prev() end)
            vim.keymap.set("n", "<Leader><S-N>", function() harpoon:list():next() end)
        end,
    },
}
