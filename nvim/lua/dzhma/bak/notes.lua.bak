return {
    {
        'MeanderingProgrammer/markdown.nvim',
        -- name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        config = function()
            require('render-markdown').setup({
                heading = {
                    sign = false,
                    icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
                },
                bullet = {
                    enabled = false,
                },
                checkbox = {
                    unchecked = {
                        icon = '╳ ',
                        highlight = '@markup.list.unchecked.markdown',
                    },
                    checked = {
                        icon = '✓ ',
                        highlight = '@markup.list.checked.markdown',
                    }
                }
            })
        end,
    },

    {
        'AckslD/nvim-FeMaco.lua',
        config = function ()
            require("femaco").setup()

            vim.keymap.set('n', '<A-f>', "<cmd>FeMaco<CR>", { noremap = true, silent = true })
        end,
    }
}
