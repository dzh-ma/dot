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

    -- DOCS: Jupyter notebook support
    {
        "goerz/jupytext.vim",
        config = function ()
            -- Jupyter notebook configuration
            vim.api.nvim_create_augroup("jupyter_config", { clear = true })
            vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
                pattern = {"*.ipynb"},
                group = "jupyter_config",
                callback = function()
                    -- Set filetype
                    vim.bo.filetype = "markdown.jupyter"

                    -- Configure magma-nvim
                    vim.keymap.set('n', '<leader>r', ':MagmaEvaluateOperator<CR>', {silent = true, noremap = true})
                    vim.keymap.set('n', '<leader>rr', ':MagmaEvaluateLine<CR>', {silent = true, noremap = true})
                    vim.keymap.set('n', '<leader>rc', ':MagmaReevaluateCell<CR>', {silent = true, noremap = true})
                    vim.keymap.set('n', '<leader>rd', ':MagmaDelete<CR>', {silent = true, noremap = true})
                    vim.keymap.set('n', '<leader>ro', ':MagmaShowOutput<CR>', {silent = true, noremap = true})

                    -- Set magma kernel (adjust as needed)
                    vim.g.magma_automatically_open_output = false
                    vim.g.magma_image_provider = "kitty"
                    vim.g.magma_cell_highlight_group = "CursorLine"

                    if vim.bo.filetype == "ocaml" or vim.bo.filetype:match(".*ocaml.*") then
                        vim.g.magma_kernel_priority = {"ocaml-jupyter"}
                    else
                        vim.g.magma_kernel_priority = {"python3"}
                    end
                end
            })

            -- Jupyter conversion settings (can use jupytext.vim instead of jupytext.nvim)
            vim.g.jupytext_fmt = 'md'
            vim.g.jupytext_style = 'markdown'
        end
    },

    -- DOCS: Jupyter integration
    {
        "dccsillag/magma-nvim",
        build = ":UpdateRemotePlugins",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        ft = {"python", "julia", "ocaml", "markdown"}, 
        config = function()
            -- Make sure to execute this after the plugin is loaded
            vim.g.magma_automatically_open_output = false
            vim.g.magma_image_provider = "kitty"  -- Or "ueberzug" if you use it
        end,
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
