return {
    -- DOCS: Markdown renderer
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        config = function ()
            require("markview").setup({
                typst = {
                    enable = true,
                    codes = {
                        padding = 0,
                    },
                },
                markdown = {
                    headings = {
                        heading_1 = { sign = "" },
                        heading_2 = { sign = "" },
                        heading_3 = { sign = "" },
                        heading_4 = { sign = "" },
                        heading_5 = { sign = "" },
                        heading_6 = { sign = "" },
                    },
                    tables = {
                        enable = true,
                        block_decorator = false,
                        use_virt_lines = false,
                    },
                    -- list_items = {
                    --     shift_width = function (buffer, item)
                    --         local parent_indnet = math.max(1, item.indent - vim.bo[buffer].shiftwidth);
                    --         return (item.indent) * (1 / (parent_indnet * 2));
                    --     end,
                    --     marker_minus = {
                    --         add_padding = function (_, item)
                    --             return item.indent > 1;
                    --         end
                    --     }
                    -- },
                    code_blocks = {
                        -- sign = false,
                        -- min_width = 14,
                        pad_amount = 0,
                        style = "block",
                    },
                },
                preview = {
                    hybrid_modes = { "v", "i" },
                },
                linewise_hybrid_mode = true,
            })

            require("markview.extras.checkboxes").setup({
                ---@type string
                default = "X",

                --- Changes how checkboxes are removed.
                ---@type
                ---| "disable" Disables the checkbox.
                ---| "checkbox" Removes the checkbox.
                ---| "list_item" Removes the list item markers too.
                remove_style = "disable",

                ---@type string[][]
                states = {
                    { " ", "/", "X" },
                    { "<", ">" },
                    { "?", "!", "*" },
                    { '"' },
                    { "l", "b", "i" },
                    { "S", "I" },
                    { "p", "c" },
                    { "f", "k", "w" },
                    { "u", "d" }
                }
            })

            require("markview.extras.editor").setup()

            vim.keymap.set("n", "<A-c>", "<cmd>Checkbox interactive<CR>", { noremap = true, silent = true })
            -- vim.keymap.set("n", "<A-f>", "<cmd>CodeCreate<CR>", { noremap = true, silent = true })
            -- vim.keymap.set("n", "<A-e>", "<cmd>CodeEdit<CR>", { noremap = true, silent = true })
        end,
    },

    -- DOCS: Help document renderer
    {
        "OXY2DEV/helpview.nvim",
        ft = "help",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    -- DOCS: Follow hyperlinks
    {
        "jghauser/follow-md-links.nvim",
        ft = { "markdown" },
    },

    -- DOCS: Table formatter
    {
        "dhruvasagar/vim-table-mode",
        ft = { "markdown", "typst" },
    },

    -- DOCS: Jupyter notebook support
    {
        "GCBallesteros/jupytext.nvim",
        lazy = false,
        opts = {},
    },

    -- DOCS: Jupyter notebook renderer
    {
        "benlubas/molten-nvim",
        version = "<2.0.0",
        build = ":UpdateRemotePlugins",
        config = function ()
            vim.g.molten_output_win_max_height = 12

            vim.keymap.set("n", "<Leader>Mi", "<cmd>MoltenInit<CR>", { silent = true, desc = "Molten: Initialize plugin" })
            vim.keymap.set("n", "<Leader>Me", "<cmd>MoltenEvaluateOperator<CR>", { silent = true, desc = "Molten: Run operator selection" })
            vim.keymap.set("n", "<Leader>Ml", "<cmd>MoltenEvaluateLine<CR>", { silent = true, desc = "Molten: Initialize line" })
            vim.keymap.set("n", "<Leader>Mc", "<cmd>MoltenReevaluateCell<CR>", { silent = true, desc = "Molten: Re-evaluate cell" })
            vim.keymap.set("n", "<Leader>Mv", "<cmd>MoltenEvaluateVisual<CR>gv", { silent = true, desc = "Molten: Evaluate visual selection" })
            vim.keymap.set("n", "<Leader>Md", "<cmd>MoltenDelete<CR>", { silent = true, desc = "Molten: Delete cell" })
            vim.keymap.set("n", "<Leader>Mh", "<cmd>MoltenHideOutput<CR>", { silent = true, desc = "Molten: Hide output" })
            vim.keymap.set("n", "<Leader>Mo", "<cmd>MoltenEnterOutput<CR>", { silent = true, desc = "Molten: Show/enter output" })
        end,
    },

    {
        'AckslD/nvim-FeMaco.lua',
        ft = "markdown",
        config = function ()
            require("femaco").setup()

            vim.keymap.set('n', '<A-f>', "<cmd>FeMaco<CR>", { noremap = true, silent = true })
        end,
    },

    -- DOCS: Bufferline
    {
        "willothy/nvim-cokeline",
        dependencies = {
            "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
            "nvim-tree/nvim-web-devicons", -- If you want devicons
            "stevearc/resession.nvim"       -- Optional, for persistent history
        },
        config = function ()
            require("cokeline").setup({
                buffers = {
                    delete_on_right_click = false,
                },
                mappings = {
                    disable_mouse = true,
                },
            })
        end,
    }
}
