return {
    {
        "vhyrro/luarocks.nvim",
        ft = 'norg',
        priority = 1000, -- We'd like this plugin to load first out of the rest
        opts = {
            rocks = { "magick" },
        },
    },

    --{
    --    "3rd/image.nvim",
    --    ft = 'norg',
    --    event = "VeryLazy",
    --    dependencies = { "luarocks.nvim" },
    --    config = function ()
    --        require("image").setup()
    --    end,
    --},

    {
        "nvim-neorg/neorg",
        dependencies = { "luarocks.nvim" },
        ft = 'norg',
        event = "VeryLazy",
        lazy = true, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        config = function ()
            require('neorg').setup {
                load = {
                    ['core.concealer'] = {                      -- UI devicon support
                        config = {
                            icon_preset = "diamond",
                            folds = false,
                            icons = {
                                code_block = {
                                    conceal = false,
                                },
                                heading = {
                                    highlights = {
                                        "@neorg.headings.1.title.norg",
                                        "@neorg.headings.2.title.norg",
                                        "@neorg.headings.3.title.norg",
                                        "@neorg.headings.4.title.norg",
                                        "@neorg.headings.5.title.norg",
                                        "@neorg.headings.6.title.norg",
                                    },
                                    icons = {
                                        " 󰎤",
                                        " 󰎧",
                                        " 󰎪",
                                        " 󰎭",
                                        " 󰎱",
                                        " 󰎳",
                                    },
                                }
                            },
                        },
                    },
                    ['core.autocommands'] = {},                 -- required to support other modules
                    ['core.integrations.treesitter'] = {},      -- treesitter highlighting support
                    --['core.integrations.image'] = {},           -- image support with image.nvim
                    ['core.esupports.metagen'] = {              -- document metadata generation
                        config = {
                            type = "auto",
                        },
                    },
                    ['core.keybinds'] = {                       -- general keybind support
                        config = {
                            default_keybinds = true,
                            hook = function (keybinds)
                                keybinds.remap("norg", "n", "<A-t>", "<cmd>Neorg tangle current-file<CR>")
                            end
                        },
                    },
                    ['core.dirman.utils'] = {},                 -- ??
                    ['core.ui'] = {},                           -- general UI support
                    ['core.esupports.hop'] = {},                -- link jumping support
                    ['core.qol.todo_items'] = {                 -- todo list automatic creation
                        config = {
                            create_todo_parents = true,
                            order = {
                                { "undone", " " },
                                { "done", "x" },
                            },
                        },
                    },
                    ['core.promo'] = {},                        -- <C-t> indent; <C-d> for dedent
                    ['core.itero'] = {},                        -- list continuation with <A-CR>
                    ['core.tangle'] = {},                       -- creates files for code blocks
                    ['core.esupports.indent'] = {
                        config = {
                            format_on_enter = true,
                            format_on_escape = true,
                            --indents = {
                            --    _  = {
                            --        indent = -999,
                            --    },
                            --},
                        },
                    },             -- automatic indentation
                    ['core.completion'] = {
                        config = {
                            engine = "nvim-cmp"
                        }
                    },                   -- autocompletion
                },
            }

            vim.keymap.set("n", "<A-K>", "<cmd>Neorg kanban toggle<CR>", { noremap = true, silent = true })
        end,
    },

    {
        'AckslD/nvim-FeMaco.lua',
        ft = "norg",
        config = function ()
            require("femaco").setup()

            vim.keymap.set('n', '<A-f>', "<cmd>FeMaco<CR>", { noremap = true, silent = true })
        end,
    },

    {
        "OXY2DEV/helpview.nvim",
        --lazy = false, -- Recommended
        ft = "help",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
    },

    {
        "dhruvasagar/vim-table-mode",
        ft = "norg",
    },

    {
        "jbyuki/nabla.nvim",
        ft = "norg",
        keys = {
            { "<leader>m", "<cmd>lua require('nabla').popup()<CR>" },
        },
        config = function ()
            require("nabla").enable_virt()
        end
    },
}
