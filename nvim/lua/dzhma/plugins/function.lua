return {
    {
        'christoomey/vim-system-copy',			        -- enables system yanking & pasting in & out of NeoVim
    },

    {
        'echasnovski/mini.move',
        version = false,
        config = function()
            require('mini.move').setup({
                mappings = {
                    -- move selection in visual mode
                    left = '<A-C-h>',
                    right = '<A-C-l>',
                    up = '<A-C-k>',
                    down = '<A-C-j>',

                    -- move current line in normal mode
                    line_left = '<A-C-h>',
                    line_right = '<A-C-l>',
                    line_up = '<A-C-k>',
                    line_down = '<A-C-j>',
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
            { "<A-b>", "<cmd>lua require('telescope.builtin').buffers()<CR>", desc = "Navigate buffers" },
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
        'stevearc/oil.nvim',					            -- file manipulation & traversal inside a buffer environment
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
        'stevearc/aerial.nvim',
        event = "VeryLazy",
        keys = { "<A-a>", "<Leader>a", "<Leader>A" },
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require("aerial").setup({
                backends = {
                    ['_'] = { "treesitter" },
                    typst = { "lsp" },
                },

                layout = {
                    max_width = { 100, 0.5 },
                    min_width = 40,
                },

                on_attach = function(bufnr)
                    vim.keymap.set('n', '<Leader>a', '<cmd>AerialNext<CR>', { buffer = bufnr })
                    vim.keymap.set('n', '<Leader>A', '<cmd>AerialPrev<CR>', { buffer = bufnr })
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
            vim.keymap.set('n', '<A-a>', '<cmd>AerialToggle!<CR>', { noremap = true, silent = true })
        end,
    },

    {
        'altermo/ultimate-autopair.nvim',
        event={'InsertEnter','CmdlineEnter'},
        branch='v0.6', --recommended as each new version will have breaking changes
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

    -- {
    --     "thunder-coding/zincoxide",
    --     opts = {
    --         zincoxide_cmd = "zoxide",
    --         complete = true,
    --         behavior = "tabs",
    --     },
    --     cmd = {
    --         "Z",
    --         "Zg",
    --         "Zt",
    --         "Zw",
    --     },
    -- },
}
