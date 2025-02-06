return {
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        config = function ()
            local presets = require("markview.presets")

            require("markview").setup({
                typst = {
                    enable = true,
                    codes = {
                        padding = 0,
                    },
                },
                markdown = {
                    headings = presets.headings.simple,
                    tables = {
                        enable = true,
                        block_decorator = false,
                        use_virt_lines = false,
                    },
                    horizontal_rules = presets.horizontal_rules.dashed,
                },
                hybrid_modes = { "v", "i" },
                linewise_hybrid_mode = true,
            })

            require("markview.extras.checkboxes").setup({
                --- Default checkbox state(used when adding checkboxes).
                ---@type string
                default = "X",

                --- Changes how checkboxes are removed.
                ---@type
                ---| "disable" Disables the checkbox.
                ---| "checkbox" Removes the checkbox.
                ---| "list_item" Removes the list item markers too.
                remove_style = "disable",

                --- Various checkbox states.
                ---
                --- States are in sets to quickly change between them
                --- when there are a lot of states.
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

            vim.keymap.set("n", "<A-c>", "<cmd>Checkbox interactive<CR>", { noremap = true, silent = true })
        end,
    },

    {
        "OXY2DEV/helpview.nvim",
        ft = "help",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    {
        "jghauser/follow-md-links.nvim",
        ft = { "markdown" },
    },

    {
        "dhruvasagar/vim-table-mode",
        ft = { "markdown", "typst" },
    },
}
