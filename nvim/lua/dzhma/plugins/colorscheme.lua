return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        dependencies = { "nvim-lualine/lualine.nvim" },
        config = function ()
            require("catppuccin").setup({
                styles = {
                    variables = { "italic" },
                }
            })

            require("lualine").setup({
                themes = "catpuccin"
            })

            vim.cmd.colorscheme("catppuccin");
        end
    },
}
