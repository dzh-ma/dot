return {
    {
        "zenbones-theme/zenbones.nvim",
        dependencies = { 'tamton-aquib/staline.nvim', "rktjmp/lush.nvim" },
        config = function ()
            vim.cmd.colorscheme('zenbones')
            require('staline').setup {
                defaults = {
                    expand_null_ls = false,  -- This expands out all the null-ls sources to be shown
                    left_separator  = "",
                    right_separator = "",
                    full_path       = false,
                    line_column     = "[%l/%L] :%c %p%% ", -- `:h stl` to see all flags.

                    fg              = "#000000",  -- Foreground text color.
                    bg              = "none",     -- Default background is transparent.
                    inactive_color  = "#303030",
                    inactive_bgcolor = "none",
                    true_colors     = false,      -- true lsp colors.
                    font_active     = "none",     -- "bold", "italic", "bold,italic", etc

                    --mod_symbol      = "  ",
                    lsp_client_symbol = " ",
                    lsp_client_character_length = 12, -- Shorten LSP client names.
                    branch_symbol   = " ",
                    cool_symbol     = " ",       -- Change this to override default OS icon.
                    null_ls_symbol = "",          -- A symbol to indicate that a source is coming from null-ls
                },
                mode_colors = {
                    n = "#FFFFFF",
                    i = "#FFFFFF",
                    c = "#FFFFFF",
                    v = "#FFFFFF",   -- etc..
                },
                --mode_icons = {
                --    n = " ",
                --    i = " ",
                --    c = " ",
                --    v = " ",   -- etc..
                --},
                sections = {
                    left = { '- ', '-mode', 'left_sep_double', ' ', 'branch' },
                    mid  = { 'file_name' },
                    right = { 'cool_symbol','right_sep_double', '-line_column' },
                },
                inactive_sections = {
                    left = { 'branch' },
                    mid  = { 'file_name' },
                    right = { 'line_column' }
                },
                special_table = {
                    NvimTree = { 'NvimTree', ' ' },
                    packer = { 'Packer',' ' },        -- etc
                },
                lsp_symbols = {
                    Error=" ",
                    Info=" ",
                    Warn=" ",
                    Hint="",
                },
            }

            require('stabline').setup {
                style       = "bar", -- others: arrow, slant, bubble
                stab_left   = " ",
                stab_right  = " ",

                fg       = "#B4BDC3",
                bg       = "#1C1917",
                inactive_bg = "#1C1917",
                inactive_fg = "#000000",
                stab_bg  = "#1C1917",

                font_active = "bold",
                exclude_fts = { 'NvimTree', 'dashboard', 'lir' },
                --stab_start  = "",   -- The starting of stabline
                --stab_end    = "",
            }
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
                    enable = true
                },
            })
        end
    },

    {
        "HampusHauffman/block.nvim",
        config = function()
            require("block").setup({})

            vim.keymap.set("n", "<A-b>", "<cmd>Block<CR>", { noremap = true, silent = true })
        end
    },
}
