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
                    horizontal_rules = presets.horizontal_rules.dashed,
                    list_items = {
                        shift_width = function (buffer, item)
                            local parent_indnet = math.max(1, item.indent - vim.bo[buffer].shiftwidth);
                            return (item.indent) * (1 / (parent_indnet * 2));
                        end,
                        marker_minus = {
                            add_padding = function (_, item)
                                return item.indent > 1;
                            end
                        }
                    },
                    code_blocks = {
                        sign = false,
                    },
                },
                preview = {
                    hybrid_modes = { "v", "i" },
                },
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

            require("markview.extras.editor").setup()

            vim.keymap.set("n", "<A-c>", "<cmd>Checkbox interactive<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<A-f>", "<cmd>CodeCreate<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<A-e>", "<cmd>CodeEdit<CR>", { noremap = true, silent = true })
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
