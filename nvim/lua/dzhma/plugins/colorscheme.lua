return {
    {
        "uncleTen276/dark_flat.nvim",
        dependencies = { 'tamton-aquib/staline.nvim' },
        config = function ()
            require("dark_flat").setup({
                transparent = true,

                themes = function (colors)
                    return {
                        -- typst
                        ["@markup.strong.typst"] = { fg = "#FFA500", bold = true },
                        ["@markup.italic.typst"] = { fg = "#00FFFF", italic = true },
                        ["@markup.heading.typst"] = { fg = "#FFFF00", underline = true, bold = true },
                        ["@markup.raw.block.typst"] = { link = "Normal" },

                        -- markdown
                        ["@markup.heading.1.markdown"] = { fg = "#FF4500", bg = "#2B1C17", bold = true }, -- Heading 1
                        ["@markup.heading.2.markdown"] = { fg = "#FFD700", bg = "#2F2B17", bold = true }, -- Heading 2
                        ["@markup.heading.3.markdown"] = { fg = "#32CD32", bg = "#1C2B1C", bold = true }, -- Heading 3
                        ["@markup.heading.4.markdown"] = { fg = "#00CED1", bg = "#172B2B", bold = true }, -- Heading 4
                        ["@markup.heading.5.markdown"] = { fg = "#9370DB", bg = "#1F1C2B", bold = true }, -- Heading 5
                        ["@markup.heading.6.markdown"] = { fg = "#FF69B4", bg = "#2B1721", bold = true }, -- Heading 6

                        -- general
                        ["@variable"] = { fg = "#41FDFE", bold = true },
                        ["Structure"] = { fg = colors.dark_cyan },
                        ["Function"] = { fg = "#0ADD08", underline = true },
                        ["LineNr"] = { fg = "#FF0000" },
                        ["String"] = { fg = "#FFFF00" },
                        ["Keyword"] = { fg = "#FF0000" },

                        -- git
                        ["GitSignsAdd"] = { fg = "#FF0000" },
                        ["GitSignsChange"] = { fg = "#FF0000" },
                        ["GitSignsDelete"] = { fg = "#FF0000" },
                        ["GitSignsTopdelete"] = { fg = "#FF0000" },
                        ["GitSignsChangedelete"] = { fg = "#FF0000" },
                        ["GitSignsUntracked"] = { fg = "#FF0000" },

                        -- general markup
                        ["@markup.strong"] = { fg = "#FF0000", bold = true },
                        ["@markup.italic"] = { fg = "#FFFF00", italic = true },
                    }
                end,
            })

            vim.cmd.colorscheme "dark_flat"

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
                stab_left   = "",
                stab_right  = " ",

                fg       = "#FFFFFF",
                bg       = "#000000",
                inactive_bg = "#000000",
                inactive_fg = "#aaaaaa",
                -- stab_bg  = Default is darker version of bg.,

                font_active = "bold",
                exclude_fts = { 'NvimTree', 'dashboard', 'lir' },
                stab_start  = "",   -- The starting of stabline
                stab_end    = "",
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
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
