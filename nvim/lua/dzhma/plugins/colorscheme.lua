return {
    {
        'maxmx03/fluoromachine.nvim',
        config = function ()
            local fm = require('fluoromachine')

            fm.setup()

            vim.cmd.colorscheme('fluoromachine')
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
