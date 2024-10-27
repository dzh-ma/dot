return {
    {
        'uncleTen276/dark_flat.nvim',
        dependencies = { 'tamton-aquib/staline.nvim' },
        config = function ()
            require("dark_flat").setup({
                transparent = true,
                themes = function (colors)
                    return {
                        ["@markup.strong"] = { fg = "#FF0000", bold = true },
                        ["@markup.italic"] = { fg = "#FFFF00", italic = true },
                        ["@markup.heading.1.markdown"] = { fg = "#FF0000", bg = "#400000", bold = true },  -- Gold ["@markup.heading.2.markdown"] = { fg = "#FFD700", bg = "#5B4A08", bold = true, italic = true },  -- Gold
                        ["@markup.heading.2.markdown"] = { fg = "#FFD700", bg = "#5B4A08", bold = true },  -- Gold
                        ["@markup.heading.3.markdown"] = { fg = "#7CFC00", bg = "#013220", bold = true },  -- LawnGreen
                        ["@markup.heading.4.markdown"] = { fg = "#40E0D0", bg = "#065465", bold = true },  -- Turquoise
                        ["@markup.heading.5.markdown"] = { fg = "#FF8C00", bg = "#B03608", bold = true },  -- DarkOrange
                        ["@markup.heading.6.markdown"] = { fg = "#9370DB", bg = "#301934", bold = true },   -- MediumPurple
                        ["@neorg.headings.1.title.norg"] = { fg = "#FF0000", bg = "#400000", bold = true, italic = true },
                        ["@neorg.headings.2.title.norg"] = { fg = "#FFD700", bg = "#5B4A08", bold = true, italic = true },
                        ["@neorg.headings.3.title.norg"] = { fg = "#7CFC00", bg = "#013220", bold = true, italic = true },
                        ["@neorg.headings.4.title.norg"] = { fg = "#40E0D0", bg = "#065465", bold = true, italic = true },
                        ["@neorg.headings.5.title.norg"] = { fg = "#FF8C00", bg = "#B03608", bold = true, italic = true },
                        ["@neorg.headings.6.title.norg"] = { fg = "#9370DB", bg = "#301934", bold = true, italic = true },
                        ["@neorg.headings.1.prefix.norg"] = { fg = "#FF0000", bg = "#400000", bold = true, italic = true },
                        ["@neorg.headings.2.prefix.norg"] = { fg = "#FFD700", bg = "#5B4A08", bold = true, italic = true },
                        ["@neorg.headings.3.prefix.norg"] = { fg = "#7CFC00", bg = "#013220", bold = true, italic = true },
                        ["@neorg.headings.4.prefix.norg"] = { fg = "#40E0D0", bg = "#065465", bold = true, italic = true },
                        ["@neorg.headings.5.prefix.norg"] = { fg = "#FF8C00", bg = "#B03608", bold = true, italic = true },
                        ["@neorg.headings.6.prefix.norg"] = { fg = "#9370DB", bg = "#301934", bold = true, italic = true },
                        ["@neorg.links.location.heading.1.norg"] = { fg = "#FF0000", bg = "#400000", bold = true, italic = true },
                        ["@neorg.links.location.heading.2.norg"] = { fg = "#FFD700", bg = "#5B4A08", bold = true, italic = true },
                        ["@neorg.links.location.heading.3.norg"] = { fg = "#7CFC00", bg = "#013220", bold = true, italic = true },
                        ["@neorg.links.location.heading.4.norg"] = { fg = "#40E0D0", bg = "#065465", bold = true, italic = true },
                        ["@neorg.links.location.heading.5.norg"] = { fg = "#FF8C00", bg = "#B03608", bold = true, italic = true },
                        ["@neorg.links.location.heading.6.norg"] = { fg = "#9370DB", bg = "#301934", bold = true, italic = true },
                        ["@neorg.links.location.heading.1.prefix.norg"] = { fg = "#FF0000", bg = "#400000", bold = true, italic = true },
                        ["@neorg.links.location.heading.2.prefix.norg"] = { fg = "#FFD700", bg = "#5B4A08", bold = true, italic = true },
                        ["@neorg.links.location.heading.3.prefix.norg"] = { fg = "#7CFC00", bg = "#013220", bold = true, italic = true },
                        ["@neorg.links.location.heading.4.prefix.norg"] = { fg = "#40E0D0", bg = "#065465", bold = true, italic = true },
                        ["@neorg.links.location.heading.5.prefix.norg"] = { fg = "#FF8C00", bg = "#B03608", bold = true, italic = true },
                        ["@neorg.links.location.heading.6.prefix.norg"] = { fg = "#9370DB", bg = "#301934", bold = true, italic = true },
                        ["@neorg.anchors.declaration.norg"] = { fg = "#FFFF00", bg = "#5B4513", bold = true },
                        ["@neorg.anchors.definition.delimiter.norg"] = { fg = "#FFFF00", bg = "#5B4513" },
                        ["@neorg.anchors.declaration.delimiter.norg"] = { fg = "#FFFF00", bg = "#5B4513" },
                        ["@neorg.links.location.url.norg"] = { fg = colors.dark_gray },
                        ["@neorg.markup.bold.norg"] = { fg = "#FF0000", bg = "#770000", bold = true },
                        ["@neorg.markup.italic.norg"] = { fg = "#00FF00", bg = "#007700", italic = true },
                        ["@neorg.markup.underline.norg"] = { fg = "#00FFFF", bg = "#007777", underline = true },
                        ["@neorg.markup.strikethrough.norg"] = { fg = "#964B00", bg = "#341D08", strikethrough = true, bold = true },
                        ["@neorg.markup.verbatim.norg"] = { fg = "#673DFF", bg = "#1F104F" },
                        ["@neorg.markup.inline_math.norg"] = { fg = "#FF69B4", bg = "#A34774", bold = true },
                        ["@neorg.markup.superscript.norg"] = { fg = "#FFC0CB", bg = "#AB7A82" },
                        ["@neorg.markup.subscript.norg"] = { fg = "#8A2BE2", bg = "#2A0134" },
                        ["@neorg.markup.variable.norg"] = { fg = "#FFA500", bg = "#8B4000", bold = true, italic = true },
                        ["@neorg.markup.spoiler.norg"] = { bg = "#7A1B0C" },
                        ["@neorg.markup.inline_comment.norg"] = { fg = "#A9A9A9", bg = "#1F1F1F", italic = true },
                        ["@neorg.quotes.1.content.norg"] = { fg = "#FF6347" },                 -- Tomato
                        ["@neorg.quotes.2.content.norg"] = { fg = "#32CD32" },                 -- LimeGreen
                        ["@neorg.quotes.3.content.norg"] = { fg = "#FF1493" },                 -- DeepPink (changed from DarkOrchid)
                        ["@neorg.quotes.4.content.norg"] = { fg = "#00FA9A" },                 -- MediumSpringGreen (changed from DeepPink)
                        ["@neorg.quotes.5.content.norg"] = { fg = "#20B2AA" },                 -- LightSeaGreen
                        ["@neorg.quotes.6.content.norg"] = { fg = "#8B4513" },                 -- SaddleBrown
                        ["@neorg.quotes.1.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        ["@neorg.quotes.2.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        ["@neorg.quotes.3.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        ["@neorg.quotes.4.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        ["@neorg.quotes.5.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        ["@neorg.quotes.6.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        ["@neorg.tags.ranged_verbatim.begin.norg"] = { fg = "#964B00", bg = "#4B280A", bold = true, italic = true },
                        ["@neorg.tags.ranged_verbatim.end.norg"] = { fg = "#964B00", bg = "#4B280A", bold = true, italic = true },
                        ["@neorg.tags.ranged_verbatim.name.word.norg"] = { fg = "#964B00", bg = "#4B280A", bold = true, italic = true},
                        ["@neorg.tags.ranged_verbatim.parameters.word.norg"] = { fg = "#66FF00", bold = true, italic = true},
                        ["@neorg.lists.ordered.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        ["@neorg.lists.unordered.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        ["@neorg.tags.ranged_verbatim.document_meta.key.norg_meta"] = { fg = "#FFFF00", bg = "#504E17", bold = true },
                        ["@neorg.todo_items.undone.norg"] = { fg = "#FF0000", bg = "#5B4513" },
                        ["@neorg.todo_items.done.norg"] = { fg = "#00FF00", bg = "#5B4513" },
                        ["@neorg.todo_items.pending.norg"] = { fg = "#00FFFF", bg = "#5B4513" },
                        ["@neorg.todo_items.uncertain.norg"] = { fg = "#FFFFFF", bg = "#5B4513" },
                        ["@neorg.todo_items.urgent.norg"] = { fg = "#FFFF00", bg = "#5B4513" },
                        ["@neorg.todo_items.recurring.norg"] = { fg = "#00FFFF", bg = "#5B4513" },
                        ["@neorg.todo_items.on_hold.norg"] = { fg = "#FFFFFF", bg = "#5B4513" },
                        ["@neorg.todo_items.cancelled.norg"] = { fg = "#000000", bg = "#5B4513" },
                        ["@variable"] = { fg = "#41FDFE", bold = true },
                        ["Structure"] = { fg = colors.dark_cyan },
                        ["Function"] = { fg = "#0ADD08", underline = true },
                        ["LineNr"] = { fg = "#FF0000" },
                        ["String"] = { fg = "#FFFF00" },
                        ["Keyword"] = { fg = "#FF0000" },
                        ["GitSignsAdd"] = { fg = "#FF0000" },
                        ["GitSignsChange"] = { fg = "#FF0000" },
                        ["GitSignsDelete"] = { fg = "#FF0000" },
                        ["GitSignsTopdelete"] = { fg = "#FF0000" },
                        ["GitSignsChangedelete"] = { fg = "#FF0000" },
                        ["GitSignsUntracked"] = { fg = "#FF0000" },
                        ["@markup.math.latex"] = { fg = "#E31C79" },
                    }
                end,
            })

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

                fg       = "#FF0000",
                -- bg       = Default is bg of "Normal".
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
}
