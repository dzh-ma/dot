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
        build = function()
            vim.fn["fzf#install"]()
        end,
    },

    {
        "linrongbin16/fzfx.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", 'junegunn/fzf' },
        -- specify version to avoid break changes
        version = 'v5.*',
        config = function()
            require("fzfx").setup()
            -- file search
            vim.keymap.set( "n", "<space>f", "<cmd>FzfxFiles<cr>", { silent = true, noremap = true, desc = "Find files" })

            -- word search
            vim.keymap.set( "n", "<space>l", "<cmd>FzfxLiveGrep<cr>", { silent = true, noremap = true, desc = "Live grep" })

            -- buffer search
            vim.keymap.set( "n", "<space>F", "<cmd>FzfxBuffers<cr>", { silent = true, noremap = true, desc = "Find buffers" })

            -- LSP diagnostics
            vim.keymap.set( "n", "<space>L", "<cmd>FzfxLspDiagnostics<cr>", { silent = true, noremap = true, desc = "Search lsp diagnostics" })
        end,
    },

    {
        'stevearc/oil.nvim',					            -- file manipulation & traversal inside a buffer environment
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
                backends = { "lsp", "markdown" },

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
        "itchyny/calendar.vim",
        config = function ()
            -- Load credentials from a separate file
            local credentials_path = vim.fn.expand('~/.cache/calendar.vim/credentials.lua')
            if vim.fn.filereadable(credentials_path) == 1 then
                dofile(credentials_path)
            else
                print("Warning: calendar.vim credentials file not found")
            end

            vim.g.calendar_google_calendar = 1
            vim.g.calendar_frame = 'default'

            vim.keymap.set("n", "<A-c>", "<cmd>Calendar<CR>", { noremap = true, silent = true })
        end,
    },

    {
        "brenoprata10/nvim-highlight-colors",
        config = function ()
            require("nvim-highlight-colors").setup({
                render = "virtual",
                virtual_symbol = "■",
                virtual_symbol_suffix = "",
                virtual_symbol_position = "eol",
            })
        end
    },

    {
        "chentoast/marks.nvim",
        config = function ()
            require("marks").setup({})
        end,
    },
}
