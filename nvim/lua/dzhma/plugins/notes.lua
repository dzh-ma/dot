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
                    backgrounds = {
                        "@neorg.anchors.norg",
                        "@neorg.anchors.declaration.norg",
                        "@neorg.links.location.url.norg",
                        "@neorg.tags.ranged_verbatim.begin.norg",
                        "@neorg.tags.ranged_verbatim.end.norg",
                        "@neorg.tags.ranged_verbatim.name.word.norg",
                    },
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
                    },
                },
            })
        end,
    },

    {
        'AckslD/nvim-FeMaco.lua',
        ft = { "markdown" },
        config = function ()
            require("femaco").setup()

            vim.keymap.set('n', '<A-f>', "<cmd>FeMaco<CR>", { noremap = true, silent = true })
        end,
    }
}
