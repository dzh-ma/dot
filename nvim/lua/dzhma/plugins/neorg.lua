return {
    {
        "nvim-neorg/neorg",
        ft = 'norg',
        event = "VeryLazy",
        lazy = false,
        version = "*",
        dependencies = {
            "benlubas/neorg-interim-ls"
        },
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
                            icon_preset = "diamond",
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
                            engine = {
                                module_name = "external.lsp-completion",
                            },
                        },
                    },
                    ['core.todo-introspector'] = {
                        config = {
                            highlight_group = "@neorg.markup.superscript.norg",
                        }
                    },
                    ['core.qol.toc'] = {
                        config = {
                            close_after_use = true,
                            max_width = 400,
                        }
                    },
                    ["external.interim-ls"] = {
                        config = {
                            -- default config shown
                            completion_provider = {
                                -- Enable or disable the completion provider
                                enable = true,

                                -- Show file contents as documentation when you complete a file name
                                documentation = true,

                                -- Try to complete categories provided by Neorg Query. Requires `benlubas/neorg-query`
                                categories = false,

                                -- suggest heading completions from the given file for `{@x|}` where `|` is your cursor
                                -- and `x` is an alphanumeric character. `{@name}` expands to `[name]{:$/people:# name}`
                                people = {
                                    enable = true,

                                    -- path to the file you're like to use with the `{@x` syntax, relative to the
                                    -- workspace root, without the `.norg` at the end.
                                    -- ie. `folder/people` results in searching `$/folder/people.norg` for headings.
                                    -- Note that this will change with your workspace, so it fails silently if the file
                                    -- doesn't exist
                                    path = "people",
                                }
                            }
                        }
                    },
                },
            }

            vim.keymap.set("n", "<A-O>", "<cmd>Neorg toc right<CR>", { noremap = true, silent = true })
        end,
    },
}
