return {
    {
        "OXY2DEV/markview.nvim",
        lazy = false,      -- Recommended
        dependencies = {
            -- You will not need this if you installed the
            -- parsers manually
            -- Or if the parsers are in your $RUNTIMEPATH
            --"nvim-treesitter/nvim-treesitter",

            "nvim-tree/nvim-web-devicons"
        },
        config = function ()
            local markview = require("markview");
            local presets = require("markview.presets");

            markview.setup({
                --headings = presets.headings.glow_labels,
                modes = { "n", "i", "c" },
                hybrid_modes = { "i", "n" },
            });

            vim.keymap.set("n", "<A-m>", "<cmd>Markview<CR>", { noremap = true, silent = true })
            --vim.cmd("Markview enableAll");
        end
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
