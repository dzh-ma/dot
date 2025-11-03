return {
    {
        "nvim-neorg/neorg",
        ft = 'norg',
        event = "VeryLazy",
        lazy = false,
        version = "*",
        config = function ()
            require('neorg').setup {
                load = {
                    ['core.autocommands'] = {},
                    ['core.esupports.indent'] = {
                        config = {
                            format_on_enter = true,
                            format_on_escape = true,
                            indents = {
                                horizontal_line = { indent = 0 },
                            },
                        },
                    },
                    ['core.concealer'] = {
                        config = {
                            icon_preset = "basic",
                            folds = false,
                            icons = {
                                code_block = {
                                    conceal = false,
                                    padding = {
                                        left = 4,
                                        right = 4,
                                    },
                                    spell_check = false,
                                },
                                ordered = {
                                    icons = {
                                        "1.",
                                        "A.",
                                        "a.",
                                        "1)",
                                        "I.",
                                        "i.",
                                    },
                                },
                            },
                        },
                    },
                    ['core.integrations.treesitter'] = {},
                    ['core.esupports.metagen'] = {
                        config = {
                            type = "auto",
                        },
                    },
                    ['core.keybinds'] = {
                        config = {
                            default_keybinds = true,
                            hook = function (keybinds)
                                keybinds.remap("norg", "n", "<A-t>", "<cmd>Neorg tangle current-file<CR>")
                            end
                        },
                    },
                    ['core.dirman.utils'] = {},
                    ['core.ui'] = {},
                    ['core.esupports.hop'] = {},
                    ['core.qol.todo_items'] = {
                        config = {
                            create_todo_parents = true,
                            order = {
                                { "undone", " " },
                                { "done", "x" },
                            },
                        },
                    },
                    ['core.promo'] = {},
                    ['core.itero'] = {},
                    ['core.tangle'] = {},
                    ['core.completion'] = {
                        config = {
                            engine = "nvim-cmp"
                        }
                    },
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
