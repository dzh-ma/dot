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

    -- optional for the 'fzf' command
    {
        "junegunn/fzf",
        event = "VeryLazy",
        build = function()
            vim.fn["fzf#install"]()
        end,
    },

    {
        "linrongbin16/fzfx.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", 'junegunn/fzf' },
        -- specify version to avoid break changes
        version = 'v5.*',
        keys = {
            {"<Space>f", "<cmd>FzfxFiles<CR>", desc = "Find files"},
            {"<Space>l", "<cmd>FzfxLiveGrep<CR>", desc = "Find words"},
            {"<Space>L", "<cmd>FzfxLspDiagnostics<CR>", desc = "Find diagnostics"},
        },
        config = function()
            require("fzfx").setup()
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
                backends = { "treesitter" },

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
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        config = function ()
            local harpoon = require("harpoon")

            -- REQUIRED
            harpoon:setup()

            -- REQUIRED
            vim.keymap.set("n", "<A-s>", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-s>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<A-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<A-j>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<A-k>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<A-l>", function() harpoon:list():select(4) end)
        end,
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
        "leath-dub/snipe.nvim",
        keys = {
            {"<A-b>", function () require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu"}
        },
        opts = {}
    },
}
