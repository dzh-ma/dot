return {
    {
        "scottmckendry/cyberdream.nvim",
        dependencies = {
            "nvim-lualine/lualine.nvim",
        },
        lazy = false,
        priority = 1000,
        config = function ()
            require("cyberdream").setup({
                variant = "light",
                transparent = true,
            })

            vim.cmd.colorscheme("cyberdream")

            require("lualine").setup({
                options = {
                    theme = "auto", -- "auto" will set the theme dynamically based on the colorscheme
                },
            })
        end
    }
}
