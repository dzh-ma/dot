return {
    {
        "nvim-neorg/neorg",
        ft = 'norg',
        event = "VeryLazy",
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
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
                                -- list = {
                                --     icons = { "" },
                                -- },
                            },
                        },
                    },
                    ['core.autocommands'] = {},                 -- required to support other modules
                    ['core.integrations.treesitter'] = {},      -- treesitter highlighting support
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
                            indents = {
                                -- heading2 = {
                                --     indent = 4,
                                -- },
                                -- heading3 = {
                                --     indent = 8,
                                -- },
                                -- heading4 = {
                                --     indent = 12,
                                -- },
                                -- heading5 = {
                                --     indent = 16,
                                -- },
                                -- heading6 = {
                                --     indent = 20,
                                -- },
                            },
                        }
                    },             -- automatic indentation
                    ['core.completion'] = {
                        config = {
                            engine = "nvim-cmp"
                        }
                    },                   -- autocompletion
                    ['core.todo-introspector'] = {
                        config = {
                            highlight_group = "@neorg.markup.superscript.norg",
                        }
                    },
                },
            }
        end,
    },
}
