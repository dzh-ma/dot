return {
    -- DOCS: Main color-scheme
    -- {
    --     "csgn/nolife.nvim",
    --     -- dependencies = "rktjmp/lush.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --      vim.cmd.colorscheme 'nolife-dark'
    --     end
    -- },

    {
        'Verf/deepwhite.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require("deepwhite").setup({
                low_blue_light = true
            })

            vim.cmd.colorscheme "deepwhite"
        end,
    },

    -- DOCS: Distinctly colored parentheses
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
