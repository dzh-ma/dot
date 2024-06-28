return {
    {
        --'sekke276/dark_flat.nvim',
        'uncleTen276/dark_flat.nvim',
        dependencies = { 'tamton-aquib/staline.nvim' },
        config = function ()
            require('dark_flat').setup {
                transparent = true,
                themes = function (colors)
                    return {
                        -- Headings (unchanged)
                        ["@neorg.headings.1.title.norg"] = { fg = "#FFD700", bold = true, italic = true },  -- Gold
                        ["@neorg.headings.2.title.norg"] = { fg = "#7CFC00", bold = true, italic = true },  -- LawnGreen
                        ["@neorg.headings.3.title.norg"] = { fg = "#40E0D0", bold = true, italic = true },  -- Turquoise
                        ["@neorg.headings.4.title.norg"] = { fg = "#FF8C00", bold = true, italic = true },  -- DarkOrange
                        ["@neorg.headings.5.title.norg"] = { fg = "#9370DB", bold = true, italic = true},   -- MediumPurple
                        ["@neorg.headings.6.title.norg"] = { fg = "#00CED1", bold = true, italic = true },  -- DarkTurquoise
                        -- Matching link colors (unchanged)
                        ["@neorg.links.location.heading.1.norg"] = { fg = "#FFD700", bold = true },
                        ["@neorg.links.location.heading.2.norg"] = { fg = "#7CFC00", bold = true },
                        ["@neorg.links.location.heading.3.norg"] = { fg = "#40E0D0", bold = true },
                        ["@neorg.links.location.heading.4.norg"] = { fg = "#FF8C00", bold = true },
                        ["@neorg.links.location.heading.5.norg"] = { fg = "#9370DB", bold = true },
                        ["@neorg.links.location.heading.6.norg"] = { fg = "#00CED1", bold = true },
                        -- Other elements
                        ["@neorg.markup.bold.norg"] = { fg = "#FF0000", bold = true },         -- Red
                        ["@neorg.markup.italic.norg"] = { fg = "#8A2BE2", italic = true },     -- BlueViolet (unchanged)
                        ["@neorg.markup.underline.norg"] = { fg = "#00FFFF", underline = true }, -- Cyan
                        ["@neorg.markup.strikethrough.norg"] = { fg = "#1E90FF", strikethrough = true, bold = true }, -- DodgerBlue
                        ["@neorg.markup.verbatim.norg"] = { fg = "#FFFF00", bg = "#4B0082" },  -- Yellow on Indigo
                        ["@neorg.markup.inline_math.norg"] = { fg = "#FF69B4" },               -- HotPink
                        ["@neorg.markup.subscript.norg"] = { fg = "#4169E1" },                 -- RoyalBlue
                        ["@neorg.markup.variable.norg"] = { fg = "#FFA500", bold = true, italic = true }, -- Orange
                        ["@neorg.markup.spoiler.norg"] = { bg = "#708090" },                   -- SlateGray
                        -- Quotes with distinct colors
                        ["@neorg.quotes.1.content.norg"] = { fg = "#FF6347" },                 -- Tomato
                        ["@neorg.quotes.2.content.norg"] = { fg = "#32CD32" },                 -- LimeGreen
                        ["@neorg.quotes.3.content.norg"] = { fg = "#FF1493" },                 -- DeepPink (changed from DarkOrchid)
                        ["@neorg.quotes.4.content.norg"] = { fg = "#00FA9A" },                 -- MediumSpringGreen (changed from DeepPink)
                        ["@neorg.quotes.5.content.norg"] = { fg = "#20B2AA" },                 -- LightSeaGreen
                        ["@neorg.quotes.6.content.norg"] = { fg = "#8B4513" },                 -- SaddleBrown
                        -- Other syntax elements (unchanged)
                        ["@neorg.anchors.norg"] = { underline = true, },
                        ["@neorg.anchors.declaration.norg"] = { fg = colors.light_green },
                        ["@neorg.links.location.url.norg"] = { fg = colors.dark_gray },
                        ["@neorg.tags.ranged_verbatim.begin.norg"] = { fg = "#964B00", bold = true, italic = true },
                        ["@neorg.tags.ranged_verbatim.end.norg"] = { fg = "#964B00", bold = true, italic = true },
                        ["@neorg.tags.ranged_verbatim.name.word.norg"] = { fg = "#964B00", bold = true, italic = true},
                        ["@neorg.tags.ranged_verbatim.parameters.word.norg"] = { fg = "#66FF00", bold = true, italic = true},
                        ["@variable"] = { fg = "#41FDFE", bold = true },
                        ["Structure"] = { fg = colors.dark_cyan },
                        ["Function"] = { fg = "#0ADD08", underline = true },
                        ["LineNr"] = { fg = "#FF0000" },
                        ["String"] = { fg = "#FFFF00", italic = true },
                    }
                end,
            }
            -- color list
            -- fg, bg, gray, pink, green, light_green, cyan, aqua, yellow, light_yellow, purple, peanut, orange, dark_cyan, red, dark_red, white, light_gray, dark_gray, vulcan, black, none

            vim.cmd.colorscheme('dark_flat')
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
                    n = "#FF0000",
                    i = "#00FF00",
                    c = "#FFFFFF",
                    v = "#00FFFF",   -- etc..
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

                -- fg       = Default is fg of "Normal".
                -- bg       = Default is bg of "Normal".
                inactive_bg = "#1e2127",
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
