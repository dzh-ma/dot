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
                    enabled = false,
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

    {

        "luk400/vim-jukit",
        ft = { "python", "jupyter" }, -- Only load for these filetypes
        config = function()
            -- Your jukit settings here
            vim.g.jukit_terminal = "kitty"
            vim.g.jukit_auto_output_hist = 0
            vim.g.jukit_use_tcomment = 0

            -- Set up keymaps only for these filetypes
            -- local function setup_jukit_keymaps()
                -- local opts = { buffer = true, silent = true }

                -- Example keymaps (adjust to your preferences)
                -- vim.keymap.set('n', '<leader>js', '<cmd>call jukit#send#section(0)<cr>', opts)
                -- vim.keymap.set('n', '<leader>jl', '<cmd>call jukit#send#line()<cr>', opts)
                -- vim.keymap.set('n', '<leader>jo', '<cmd>call jukit#cells#create_below(0)<cr>', opts)
                -- vim.keymap.set('n', '<leader>jO', '<cmd>call jukit#cells#create_above(0)<cr>', opts)
                -- vim.keymap.set('n', '<leader>jd', '<cmd>call jukit#cells#delete()<cr>', opts)
                -- vim.keymap.set('n', '<leader>jx', '<cmd>call jukit#splits#close_output_split()<cr>', opts)
            -- end

            -- Auto-create keymaps for these filetypes
            -- vim.api.nvim_create_autocmd("FileType", {
            --     pattern = { "python", "jupyter" },
            --     callback = setup_jukit_keymaps,
            -- })
        end,
    },
}
