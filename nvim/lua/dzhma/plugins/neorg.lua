return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- We'd like this plugin to load first out of the rest
        opts = {
            rocks = { "magick" },
        },
    },

    {
        "3rd/image.nvim",
        ft = { 'norg', 'md' },
        event = "VeryLazy",
        dependencies = { "luarocks.nvim" },
        config = function ()
            require("image").setup()
        end,
    },

    {
        "nvim-neorg/neorg",
        dependencies = { "luarocks.nvim" },
        -- ft = 'norg',
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
                                    conceal = true,
                                },
                                list = {
                                    icons = { "" },
                                },
                            },
                        },
                    },
                    ['core.autocommands'] = {},                 -- required to support other modules
                    ['core.integrations.treesitter'] = {},      -- treesitter highlighting support
                    ['core.integrations.image'] = {},           -- image support with image.nvim
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
                    ['core.esupports.indent'] = {},
                },
            }
        end,
    },

    -- {
    --     "lukas-reineke/headlines.nvim",
    --     ft = { 'norg' },
    --     dependencies = "nvim-treesitter/nvim-treesitter",
    --     config = function ()
    --         -- vim.cmd([[highlight CodeBlock guibg=#1E2130]])
    --         vim.cmd([[highlight CodeBlock guibg=#140D07]])
    --         require('headlines').setup({
    --             norg = {
    --                 fat_headlines = false,
    --             }
    --         })
    --     end
    -- },
}
