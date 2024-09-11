return {
    {
        "OXY2DEV/markview.nvim",
        --lazy = false,      -- Recommended
        event = "VeryLazy",
        ft = "markdown",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function ()
            local markview = require("markview");
            --local presets = require("markview.presets");

            markview.setup({
                headings = {
                    enable = true,
                    heading_1 = {
                        hl = "@markup.heading.1.markdown"
                    },
                    heading_2 = {
                        hl = "@markup.heading.2.markdown"
                    },
                    heading_3 = {
                        hl = "@markup.heading.3.markdown"
                    },
                    heading_4 = {
                        hl = "@markup.heading.4.markdown"
                    },
                    heading_5 = {
                        hl = "@markup.heading.5.markdown"
                    },
                    heading_6 = {
                        hl = "@markup.heading.6.markdown"
                    },
                },
                modes = { "n", "i", "c", "v" },
                hybrid_modes = { "i", "n" },
                --hybrid_modes = { "i" },
            });

            vim.keymap.set("n", "<A-m>", "<cmd>Markview toggle<CR>", { noremap = true, silent = true })
            --vim.cmd("Markview enableAll");
        end
    },

    {
        'AckslD/nvim-FeMaco.lua',
        keys = {
            { "<A-f>", "<cmd>FeMaco<CR>", "code block isolation" },
        },
        config = function ()
            require("femaco").setup()
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
        "jghauser/follow-md-links.nvim",
        ft = "markdown",
    },

    {
        "dhruvasagar/vim-table-mode",
        ft = "markdown"
    },

    {
       "iamcco/markdown-preview.nvim",
       ft = { "markdown" },
       build = "cd app && yarn install",
       config = function() vim.g.mkdp_filetypes = { "markdown" } end,
    },
}
