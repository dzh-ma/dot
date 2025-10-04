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
        ft = { "markdown", "typst", "norg" },
    },

    -- DOCS: Code-block containerization
    {
        'AckslD/nvim-FeMaco.lua',
        ft = "markdown",
        config = function ()
            require("femaco").setup()

            vim.keymap.set('n', '<A-f>', "<cmd>FeMaco<CR>", { noremap = true, silent = true })
        end,
    },

    -- DOCS: Markdown renderer
    {
        'MeanderingProgrammer/render-markdown.nvim',
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        config = function ()
            require("render-markdown").setup({
                completions = {
                    -- lsp = {
                    --     enabled = true,
                    -- }
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
                    foregrounds = {
                        "@neorg.headings.1.title.norg",
                        "@neorg.headings.2.title.norg",
                        "@neorg.headings.3.title.norg",
                        "@neorg.headings.4.title.norg",
                        "@neorg.headings.5.title.norg",
                        "@neorg.headings.6.title.norg",
                    },
                    backgrounds = {
                        "@neorg.headings.1.title.norg",
                        "@neorg.headings.2.title.norg",
                        "@neorg.headings.3.title.norg",
                        "@neorg.headings.4.title.norg",
                        "@neorg.headings.5.title.norg",
                        "@neorg.headings.6.title.norg",
                    },
                },
                code = {
                    render_modes = true,
                    width = "block",
                    border = "thick",
                },
                pipe_table = {
                    style = "normal",
                },
                latex = {
                    enabled = true,
                    render_modes = false,
                    converter = 'latex2text',
                    highlight = 'RenderMarkdownMath',
                    position = 'above',
                    top_pad = 0,
                    bottom_pad = 0,
                },
            })
        end,
        opts = {},
    },
}
