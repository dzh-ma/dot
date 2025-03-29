return {
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

    -- DOCS: Codeblock containerization
    {
        'AckslD/nvim-FeMaco.lua',
        ft = "markdown",
        config = function ()
            require("femaco").setup()

            vim.keymap.set('n', '<A-f>', "<cmd>FeMaco<CR>", { noremap = true, silent = true })
        end,
    },

    {
        'MeanderingProgrammer/render-markdown.nvim',
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        config = function ()
            require("render-markdown").setup({
                completions = {
                    lsp = {
                        enabled = true,
                    }
                },
                sign = {
                    enabled = false,
                },
                indent = {
                    enabled = true,
                    render_modes = true,
                },
                heading = {
                    position = "overlay",
                    left_pad = 0.5
                },
                code = {
                    render_modes = true,
                    width = "block",
                    border = "thick",
                    left_margin = 0.5,
                    left_pad = 0.2,
                    right_pad = 0.2,
                },
                pipe_table = {
                    style = "normal",
                }
            })
        end,
        opts = {},
    },
}
