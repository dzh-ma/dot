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

    -- DOCS: Chunk highlighting
    -- {
        -- "shellRaining/hlchunk.nvim",
        -- event = {
        --     "BufReadPre",
        --     "BufNewFile",
        -- },
        -- config = function()
        --     require("hlchunk").setup({
        --         chunk = {
        --             enable = true,
        --             style = {
        --                 { fg = "#ffffff" },
        --                 { fg = "#ffffff" },
        --             },
        --             delay = 0,
        --             duration = 0,
        --         },
        --         indent = {
        --             enable = false,
        --         },
        --         line_num = {
        --             enable = true,
        --             style = "#ffffff",
        --         }
        --     })
        -- end
    -- },

    -- DOCS: Distinctly colored parentheses
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
