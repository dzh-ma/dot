return {
    {
        url = "https://codeberg.org/jthvai/lavender.nvim",
        dependencies = { 'tamton-aquib/staline.nvim' },
        config = function ()
            vim.g.lavender = {
                transparent = {
                    background = true,
                    float = true,
                    popup = true,
                    sidebar = true,
                },
                overrides = {
                    theme = {
                        ['@markup.italic'] = { fg = "Green", italic = true },
                        ['@markup.strong'] = { fg = "Red", bold = true },
                        ['@markup.list.checked.markdown'] = { fg = "Green", bold = true },
                        ['@markup.list.unchecked.markdown'] = { fg = "Red", bold = true },
                    }
                }
            }

            vim.cmd.colorscheme('lavender')

            require('staline').setup {
                defaults = {
                    expand_null_ls = false,  -- This expands out all the null-ls sources to be shown
                    left_separator  = "",
                    right_separator = "",
                    full_path       = false,
                    line_column     = "[%l/%L] :%c %p%% ", -- `:h stl` to see all flags.

                    fg              = "#FFFFFF",  -- Foreground text color.
                    bg              = "none",     -- Default background is transparent.
                    inactive_color  = "#303030",
                    inactive_bgcolor = "none",
                    true_colors     = "none",      -- true lsp colors.
                    font_active     = "none",     -- "bold", "italic", "bold,italic", etc

                    --mod_symbol      = "  ",
                    lsp_client_symbol = " ",
                    lsp_client_character_length = 12, -- Shorten LSP client names.
                    branch_symbol   = " ",
                    cool_symbol     = " ",       -- Change this to override default OS icon.
                    null_ls_symbol = "",          -- A symbol to indicate that a source is coming from null-ls
                },
                mode_colors = {
                    n = "none",
                    i = "none",
                    c = "none",
                    v = "none",   -- etc..
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
                stab_left   = "",
                stab_right  = "",

                fg       = "#B4BDC3",
                bg       = "none",
                inactive_bg = "none",
                inactive_fg = "#202020",
                stab_bg  = "none",

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
            local default_conf = {
                enable = false,
                style = {},
                notify = false,
                priority = 0,
                exclude_filetypes = {
                    aerial = true,
                    dashboard = true,
                    -- some other filetypes
                }
            }
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
