return {
    {
        dir = "/home/dzhma/Coding/Lua/deepwhite.nvim",
        -- dir = "/home/dzhma/Coding/Lua/deepblack.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000,
        dependencies = { 'tamton-aquib/staline.nvim' },
        config = function ()
            vim.cmd.colorscheme("deepwhite")
            -- require('deepblack').load()

            require('staline').setup {
                defaults = {
                    expand_null_ls = false,  -- This expands out all the null-ls sources to be shown
                    left_separator  = "",
                    right_separator = "",
                    full_path       = false,
                    line_column     = "[%l/%L] :%c %p%% ", -- `:h stl` to see all flags.

                    fg              = "#FAF2EB",  -- Foreground text color.
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
                    n = "#000000",
                    i = "#000000",
                    c = "#000000",
                    v = "#000000",   -- etc..
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
                stab_left   = "┃",
                stab_right  = " ",

                fg       = "#000000",
                -- bg       = Default is bg of "Normal".
                inactive_bg = "#FAF2EB",
                inactive_fg = "#aaaaaa",
                -- stab_bg  = Default is darker version of bg.,

                font_active = "bold",
                exclude_fts = { 'NvimTree', 'dashboard', 'lir' },
                stab_start  = "",   -- The starting of stabline
                stab_end    = "",
            }
        end,
    },
}
