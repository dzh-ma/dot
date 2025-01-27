return {
    -- {
    --     "MeanderingProgrammer/render-markdown.nvim",
    --     dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    --     event = { "VeryLazy" },
    --     ft = { "markdown" },
    --     opts = {
    --         bullet = {
    --             enabled = false,
    --         },
    --         indent = {
    --             enabled = true,
    --             per_level = 2,
    --             skip_heading = false,
    --         },
    --         latex = {
    --             enabled = false,
    --         },
    --     },
    -- },

    {
        "OXY2DEV/markview.nvim",
        dependencies = {
            "3rd/image.nvim"
        },
        lazy = false,
        config = function ()
            require("markview").setup({
                typst = {
                    enable = true,
                    codes = {
                        padding = 0,
                    },
                },
            })

            require("image").setup()
        end,
    },

    {
        "AckslD/nvim-FeMaco.lua",
        keys = {
            { "<A-f>", "<cmd>FeMaco<CR>", "code block isolation" },
        },
        config = function ()
            require("femaco").setup()
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

    {
        "iamcco/markdown-preview.nvim",
        ft = { "markdown" },
        build = "cd app && yarn install",
        config = function() vim.g.mkdp_filetypes = { "markdown" } end,
    },

    {
        "opdavies/toggle-checkbox.nvim",
        ft = { "markdown" },
        config = function ()
            vim.keymap.set("n", "<A-t>", ":lua require('toggle-checkbox').toggle()<CR>")
        end
    },
}
