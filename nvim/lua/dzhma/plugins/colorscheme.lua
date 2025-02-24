return {
    -- DOCS: Main color-scheme
    {
        "0xstepit/flow.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            colors = {
                custom = {
                    saturation = "100",
                },
            },
            ui = {
                borders = "fluo",
            }
        },
        config = function ()
            require("flow").setup(opts)

            vim.cmd.colorscheme "flow"
        end
    },

    -- DOCS: Distinctly colored parentheses
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
