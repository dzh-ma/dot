return {
    -- DOCS: Main color-scheme
    -- {
    --     "0xstepit/flow.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {
    --         colors = {
    --             custom = {
    --                 saturation = "100",
    --             },
    --         },
    --         ui = {
    --             borders = "fluo",
    --         }
    --     },
    --     config = function ()
    --         require("flow").setup(opts)
    --
    --         vim.cmd.colorscheme "flow"
    --     end
    -- },
    {
        "rmehri01/onenord.nvim",
        lazy = false,
        priority = 1000,
        config = function ()
            require("onenord").setup()

            vim.cmd.colorscheme "onenord"
        end
    },

    -- DOCS: Distinctly colored parentheses
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    {
        "tomiis4/BufferTabs.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional
        },
        lazy = false,
        config = function()
            require("buffertabs").setup()
        end
    },
}
