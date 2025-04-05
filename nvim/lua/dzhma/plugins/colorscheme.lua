return {
    {
        'uncleTen276/dark_flat.nvim',
        dependencies = {
            "nvim-lualine/lualine.nvim",
        },
        config = function ()
            require("dark_flat").setup({
                transparent = true,
                themes = function (colors)
                    return {
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

                        -- render-markdown
                        ["RenderMarkdownUnchecked"] = { fg = "#FF0000", bold = true },
                        ["RenderMarkdownChecked"] = { fg = "#00FF00", bold = true },

                        -- neorg headings
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

                        -- neorg links
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

                        -- neorg markup
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

                        -- neorg quotes
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

                        -- neorg modifiers
                        ["@neorg.tags.ranged_verbatim.begin.norg"] = { fg = "#964B00", bg = "#4B280A", bold = true, italic = true },
                        ["@neorg.tags.ranged_verbatim.end.norg"] = { fg = "#964B00", bg = "#4B280A", bold = true, italic = true },
                        ["@neorg.tags.ranged_verbatim.name.word.norg"] = { fg = "#964B00", bg = "#4B280A", bold = true, italic = true},
                        ["@neorg.tags.ranged_verbatim.parameters.word.norg"] = { fg = "#66FF00", bold = true, italic = true},
                        ["@neorg.lists.ordered.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        ["@neorg.lists.unordered.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        ["@neorg.tags.ranged_verbatim.document_meta.key.norg_meta"] = { fg = "#FFFF00", bg = "#504E17", bold = true },

                        -- neorg todo
                        ["@neorg.todo_items.undone.norg"] = { fg = "#FF0000", bg = "#5B4513" },
                        ["@neorg.todo_items.done.norg"] = { fg = "#00FF00", bg = "#5B4513" },
                        ["@neorg.todo_items.pending.norg"] = { fg = "#00FFFF", bg = "#5B4513" },
                        ["@neorg.todo_items.uncertain.norg"] = { fg = "#FFFFFF", bg = "#5B4513" },
                        ["@neorg.todo_items.urgent.norg"] = { fg = "#FFFF00", bg = "#5B4513" },
                        ["@neorg.todo_items.recurring.norg"] = { fg = "#00FFFF", bg = "#5B4513" },
                        ["@neorg.todo_items.on_hold.norg"] = { fg = "#FFFFFF", bg = "#5B4513" },
                        ["@neorg.todo_items.cancelled.norg"] = { fg = "#000000", bg = "#5B4513" },
                    }
                end,
            })

            vim.cmd.colorscheme('dark_flat')
            
            -- Bubbles config for lualine
            -- Author: lokesh-krishna
            -- MIT license, see LICENSE for more details.

            -- stylua: ignore
            local colors = {
                black  = '#000000', -- background from config
                white  = '#fefefe', -- palette 15
                grey   = '#313244', -- palette 0
                blue   = '#00b0ff', -- palette 4
                cyan   = '#64fcda', -- palette 6
                red    = '#d03770', -- palette 9
                violet = '#ee2c68', -- palette 5/cursor-color
                green  = '#3dd177', -- palette 2
                yellow = '#ffc900', -- palette 3
                foreground = '#b0bec4', -- foreground from config
            }

            local bubbles_theme = {
                normal = {
                    a = { fg = colors.black, bg = colors.violet },
                    b = { fg = colors.foreground, bg = colors.grey },
                    c = { fg = colors.foreground },
                },
                insert = { a = { fg = colors.black, bg = colors.blue } },
                visual = { a = { fg = colors.black, bg = colors.cyan } },
                replace = { a = { fg = colors.black, bg = colors.red } },
                command = { a = { fg = colors.black, bg = colors.green } },
                inactive = {
                    a = { fg = colors.foreground, bg = colors.black },
                    b = { fg = colors.foreground, bg = colors.black },
                    c = { fg = colors.foreground },
                },
            }

            require('lualine').setup {
                options = {
                    theme = bubbles_theme,
                    component_separators = '',
                    section_separators = { left = '', right = '' },
                },
                sections = {
                    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
                    lualine_b = { 'filename', 'branch' },
                    lualine_c = {
                        '%=', --[[ add your center components here in place of this comment ]]
                    },
                    lualine_x = {},
                    lualine_y = { 'filetype', 'progress' },
                    lualine_z = {
                        { 'location', separator = { right = '' }, left_padding = 2 },
                    },
                },
                inactive_sections = {
                    lualine_a = { 'filename' },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { 'location' },
                },
                tabline = {},
                extensions = {},
            }
        end,
    },

    --{
    --    "lukas-reineke/indent-blankline.nvim",
    --    event = { "BufReadPre", "BufNewFile" },
    --    main = "ibl",
    --    config = function()
    --        require("ibl").setup({})
    --    end
    --},
}
