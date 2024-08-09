return {
    {
        dir = "/home/dzhma/Coding/Lua/deepwhite.nvim",
        config = function ()
            local dw = require('deepwhite')

            dw.setup({
                low_blue_light = false
            })

            vim.cmd.colorscheme('deepwhite')
        end,
    },

    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("hlchunk").setup({
                chunk = {
                    enable = true
                },
                indent = {
                    enable = true,
                },
            })
        end
    },
}
