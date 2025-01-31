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
        },
        cmd = "Telescope",
        keys = {
            { "<Space>f", "<cmd>lua require('telescope.builtin').find_files()<CR>", desc = "Navigate directory" },
            { "<Space>l", "<cmd>lua require('telescope.builtin').live_grep()<CR>", desc = "Find phrase" },
        },
        config = function()
            -- require telescope
            local telescope = require("telescope")

            -- require telescope actions
            local actions = require("telescope.actions")

            -- load fzf
            telescope.load_extension("fzf")

            -- custom setup
            telescope.setup({
                defaults = {
                    layout_strategy = "vertical", -- vertical layout
                    sorting_strategy = "ascending",
                    results_title = "",
                    prompt_prefix = "  ", --  ›
                    selection_caret = " › ",
                    entry_prefix = "   ", -- each entry result prefix
                    layout_config = {
                        prompt_position = "top",
                        width = 0.7,
                        height = 0.6,
                    },
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        },
                    },
                    -- result numbers at the right: matches|total
                    get_status_text = function(picker)
                        local total = picker.stats.processed or 0
                        local matches = total - (picker.stats.filtered or 0)

                        if matches == 0 and total == 0 then
                            return ""
                        end

                        return string.format("%s|%s ", matches, total)
                    end,
                },
                pickers = {
                    find_files = {
                        previewer = false,
                        layout_config = {
                            prompt_position = "top",
                            width = 0.6,
                            height = 0.5,
                        },
                    },
                    live_grep = {
                        previewer = false,
                        prompt_title = "Global Search",
                        results_title = "", -- results
                        layout_config = {
                            prompt_position = "top",
                            width = 0.7,
                            height = 0.6,
                        },
                    },
                    current_buffer_fuzzy_find = {
                        previewer = false,
                        prompt_title = "Search",
                        results_title = "", -- results
                        layout_config = {
                            prompt_position = "top",
                            width = 0.7,
                            height = 0.6,
                        },
                    },
                    buffers = {
                        previewer = false,
                        layout_config = {
                            prompt_position = "top",
                            width = 0.6,
                            height = 0.5,
                        },
                    },
                    git_bcommits = {
                        previewer = false,
                        layout_config = {
                            prompt_position = "top",
                            width = 0.7,
                            height = 0.6,
                        },
                    },
                    git_commits = {
                        previewer = false,
                        layout_config = {
                            prompt_position = "top",
                            width = 0.7,
                            height = 0.6,
                        },
                    },
                    git_status = {
                        previewer = false,
                        layout_config = {
                            prompt_position = "top",
                            width = 0.6,
                            height = 0.5,
                        },
                    },
                    git_branches = {
                        previewer = false,
                        layout_config = {
                            prompt_position = "top",
                            width = 0.6,
                            height = 0.5,
                        },
                        -- overwrite default behavior of checking out to dettached HEAD
                        mappings = {
                            i = { ["<cr>"] = actions.git_switch_branch },
                        },
                    },
                    diagnostics = {
                        previewer = false,
                        prompt_title = "Diagnostics",
                        layout_config = {
                            prompt_position = "top",
                            width = 0.6,
                            height = 0.5,
                        },
                    },
                },
                extensions = {
                    persisted = {
                        layout_config = {
                            prompt_position = "top",
                            width = 0.6,
                            height = 0.5,
                        },
                    },
                },
            })
        end,
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
