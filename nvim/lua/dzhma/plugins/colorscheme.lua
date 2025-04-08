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
                        ["@markup.list.unchecked.markdown"] = { fg = "#FF0000", bold = true },
                        ["@markup.list.checked.markdown"] = { fg = "#00FF00", bold = true },

                        -- render-markdown
                        ["RenderMarkdownUnchecked"] = { fg = "#FF0000", bold = true },
                        ["RenderMarkdownChecked"] = { fg = "#00FF00", bold = true },
                        ["RenderMarkdownInlineHighlight"] = { bg = "#383a3e" },

                        -- neorg headings
                        -- ["@neorg.headings.1.title.norg"] = { fg = "#FF0000", bg = "#400000", bold = true, italic = true },
                        -- ["@neorg.headings.2.title.norg"] = { fg = "#FFD700", bg = "#5B4A08", bold = true, italic = true },
                        -- ["@neorg.headings.3.title.norg"] = { fg = "#7CFC00", bg = "#013220", bold = true, italic = true },
                        -- ["@neorg.headings.4.title.norg"] = { fg = "#40E0D0", bg = "#065465", bold = true, italic = true },
                        -- ["@neorg.headings.5.title.norg"] = { fg = "#FF8C00", bg = "#B03608", bold = true, italic = true },
                        -- ["@neorg.headings.6.title.norg"] = { fg = "#9370DB", bg = "#301934", bold = true, italic = true },
                        -- ["@neorg.headings.1.prefix.norg"] = { fg = "#FF0000", bg = "#400000", bold = true, italic = true },
                        -- ["@neorg.headings.2.prefix.norg"] = { fg = "#FFD700", bg = "#5B4A08", bold = true, italic = true },
                        -- ["@neorg.headings.3.prefix.norg"] = { fg = "#7CFC00", bg = "#013220", bold = true, italic = true },
                        -- ["@neorg.headings.4.prefix.norg"] = { fg = "#40E0D0", bg = "#065465", bold = true, italic = true },
                        -- ["@neorg.headings.5.prefix.norg"] = { fg = "#FF8C00", bg = "#B03608", bold = true, italic = true },
                        -- ["@neorg.headings.6.prefix.norg"] = { fg = "#9370DB", bg = "#301934", bold = true, italic = true },
                        ["@neorg.headings.1.title.norg"] = { fg = "#FF0000", bold = true, italic = true },
                        ["@neorg.headings.2.title.norg"] = { fg = "#FFD700", bold = true, italic = true },
                        ["@neorg.headings.3.title.norg"] = { fg = "#7CFC00", bold = true, italic = true },
                        ["@neorg.headings.4.title.norg"] = { fg = "#40E0D0", bold = true, italic = true },
                        ["@neorg.headings.5.title.norg"] = { fg = "#FF8C00", bold = true, italic = true },
                        ["@neorg.headings.6.title.norg"] = { fg = "#9370DB", bold = true, italic = true },
                        ["@neorg.headings.1.prefix.norg"] = { fg = "#FF0000", bold = true, italic = true },
                        ["@neorg.headings.2.prefix.norg"] = { fg = "#FFD700", bold = true, italic = true },
                        ["@neorg.headings.3.prefix.norg"] = { fg = "#7CFC00", bold = true, italic = true },
                        ["@neorg.headings.4.prefix.norg"] = { fg = "#40E0D0", bold = true, italic = true },
                        ["@neorg.headings.5.prefix.norg"] = { fg = "#FF8C00", bold = true, italic = true },
                        ["@neorg.headings.6.prefix.norg"] = { fg = "#9370DB", bold = true, italic = true },

                        -- neorg links
                        -- ["@neorg.links.location.heading.1.norg"] = { fg = "#FF0000", bg = "#400000", bold = true, italic = true },
                        -- ["@neorg.links.location.heading.2.norg"] = { fg = "#FFD700", bg = "#5B4A08", bold = true, italic = true },
                        -- ["@neorg.links.location.heading.3.norg"] = { fg = "#7CFC00", bg = "#013220", bold = true, italic = true },
                        -- ["@neorg.links.location.heading.4.norg"] = { fg = "#40E0D0", bg = "#065465", bold = true, italic = true },
                        -- ["@neorg.links.location.heading.5.norg"] = { fg = "#FF8C00", bg = "#B03608", bold = true, italic = true },
                        -- ["@neorg.links.location.heading.6.norg"] = { fg = "#9370DB", bg = "#301934", bold = true, italic = true },
                        -- ["@neorg.links.location.heading.1.prefix.norg"] = { fg = "#FF0000", bg = "#400000", bold = true, italic = true },
                        -- ["@neorg.links.location.heading.2.prefix.norg"] = { fg = "#FFD700", bg = "#5B4A08", bold = true, italic = true },
                        -- ["@neorg.links.location.heading.3.prefix.norg"] = { fg = "#7CFC00", bg = "#013220", bold = true, italic = true },
                        -- ["@neorg.links.location.heading.4.prefix.norg"] = { fg = "#40E0D0", bg = "#065465", bold = true, italic = true },
                        -- ["@neorg.links.location.heading.5.prefix.norg"] = { fg = "#FF8C00", bg = "#B03608", bold = true, italic = true },
                        -- ["@neorg.links.location.heading.6.prefix.norg"] = { fg = "#9370DB", bg = "#301934", bold = true, italic = true },
                        -- ["@neorg.anchors.declaration.norg"] = { fg = "#FFFF00", bg = "#5B4513", bold = true },
                        -- ["@neorg.anchors.definition.delimiter.norg"] = { fg = "#FFFF00", bg = "#5B4513" },
                        -- ["@neorg.anchors.declaration.delimiter.norg"] = { fg = "#FFFF00", bg = "#5B4513" },
                        ["@neorg.links.location.heading.1.norg"] = { fg = "#FF0000", bold = true, italic = true },
                        ["@neorg.links.location.heading.2.norg"] = { fg = "#FFD700", bold = true, italic = true },
                        ["@neorg.links.location.heading.3.norg"] = { fg = "#7CFC00", bold = true, italic = true },
                        ["@neorg.links.location.heading.4.norg"] = { fg = "#40E0D0", bold = true, italic = true },
                        ["@neorg.links.location.heading.5.norg"] = { fg = "#FF8C00", bold = true, italic = true },
                        ["@neorg.links.location.heading.6.norg"] = { fg = "#9370DB", bold = true, italic = true },
                        ["@neorg.links.location.heading.1.prefix.norg"] = { fg = "#FF0000", bold = true, italic = true },
                        ["@neorg.links.location.heading.2.prefix.norg"] = { fg = "#FFD700", bold = true, italic = true },
                        ["@neorg.links.location.heading.3.prefix.norg"] = { fg = "#7CFC00", bold = true, italic = true },
                        ["@neorg.links.location.heading.4.prefix.norg"] = { fg = "#40E0D0", bold = true, italic = true },
                        ["@neorg.links.location.heading.5.prefix.norg"] = { fg = "#FF8C00", bold = true, italic = true },
                        ["@neorg.links.location.heading.6.prefix.norg"] = { fg = "#9370DB", bold = true, italic = true },
                        ["@neorg.anchors.declaration.norg"] = { fg = "#FFFF00", bold = true },
                        ["@neorg.anchors.definition.delimiter.norg"] = { fg = "#FFFF00", },
                        ["@neorg.anchors.declaration.delimiter.norg"] = { fg = "#FFFF00", },
                        ["@neorg.links.location.url.norg"] = { fg = colors.dark_gray },

                        -- neorg markup
                        ["@neorg.markup.bold.norg"] = { fg = "#FF0000",  bold = true },
                        ["@neorg.markup.italic.norg"] = { fg = "#00FF00",  italic = true },
                        ["@neorg.markup.underline.norg"] = { fg = "#00FFFF", underline = true },
                        ["@neorg.markup.strikethrough.norg"] = { fg = "#964B00", strikethrough = true, bold = true },
                        ["@neorg.markup.verbatim.norg"] = { fg = "#FFFFFF", bg = "#673DFF" },
                        ["@neorg.markup.inline_math.norg"] = { fg = "#FF69B4", bold = true },
                        ["@neorg.markup.superscript.norg"] = { fg = "#FFC0CB" },
                        ["@neorg.markup.subscript.norg"] = { fg = "#8A2BE2" },
                        ["@neorg.markup.variable.norg"] = { fg = "#FFA500", bold = true, italic = true },
                        ["@neorg.markup.spoiler.norg"] = { bg = "#7A1B0C" },
                        ["@neorg.markup.inline_comment.norg"] = { fg = "#A9A9A9", italic = true },

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
                        -- ["@neorg.tags.ranged_verbatim.begin.norg"] = { fg = "#964B00", bg = "#4B280A", bold = true, italic = true },
                        -- ["@neorg.tags.ranged_verbatim.end.norg"] = { fg = "#964B00", bg = "#4B280A", bold = true, italic = true },
                        -- ["@neorg.tags.ranged_verbatim.name.word.norg"] = { fg = "#964B00", bg = "#4B280A", bold = true, italic = true},
                        -- ["@neorg.tags.ranged_verbatim.parameters.word.norg"] = { fg = "#66FF00", bold = true, italic = true},
                        -- ["@neorg.lists.ordered.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        -- ["@neorg.lists.unordered.prefix.norg"] = { fg = "#FFFF00", bg = "#5B4A08" },
                        -- ["@neorg.tags.ranged_verbatim.document_meta.key.norg_meta"] = { fg = "#FFFF00", bg = "#504E17", bold = true },
                        -- ["@neorg.footnotes.content.norg"] = { fg = "#FFFF00", bg = "#515151", bold = true },
                        -- ["@neorg.definitions.content.norg"] = { fg = "#00FFFF", bg = "#515151", bold = true },
                        -- ["@neorg.tags.ranged_verbatim.begin.norg"] = { fg = "#964B00", bg = "#4B280A", bold = true, italic = true },
                        ["@neorg.tags.ranged_verbatim.end.norg"] = { fg = "#964B00", bold = true, italic = true },
                        ["@neorg.tags.ranged_verbatim.name.word.norg"] = { fg = "#964B00", bold = true, italic = true},
                        ["@neorg.tags.ranged_verbatim.parameters.word.norg"] = { fg = "#66FF00", bold = true, italic = true},
                        ["@neorg.lists.ordered.prefix.norg"] = { fg = "#FF0000" },
                        ["@neorg.lists.unordered.prefix.norg"] = { fg = "#FF0000" },
                        ["@neorg.tags.ranged_verbatim.document_meta.key.norg_meta"] = { fg = "#FFFF00", bold = true },
                        ["@neorg.footnotes.content.norg"] = { fg = "#FFFF00", bold = true },
                        ["@neorg.definitions.content.norg"] = { fg = "#00FFFF", bold = true },

                        -- neorg todo
                        -- ["@neorg.todo_items.undone.norg"] = { fg = "#FF0000", bg = "#5B4513" },
                        -- ["@neorg.todo_items.done.norg"] = { fg = "#00FF00", bg = "#5B4513" },
                        -- ["@neorg.todo_items.pending.norg"] = { fg = "#00FFFF", bg = "#5B4513" },
                        -- ["@neorg.todo_items.uncertain.norg"] = { fg = "#FFFFFF", bg = "#5B4513" },
                        -- ["@neorg.todo_items.urgent.norg"] = { fg = "#FFFF00", bg = "#5B4513" },
                        -- ["@neorg.todo_items.recurring.norg"] = { fg = "#00FFFF", bg = "#5B4513" },
                        -- ["@neorg.todo_items.on_hold.norg"] = { fg = "#FFFFFF", bg = "#5B4513" },
                        -- ["@neorg.todo_items.cancelled.norg"] = { fg = "#000000", bg = "#5B4513" },
                        ["@neorg.todo_items.undone.norg"] = { fg = "#FF0000" },
                        ["@neorg.todo_items.done.norg"] = { fg = "#00FF00" },
                        ["@neorg.todo_items.pending.norg"] = { fg = "#00FFFF" },
                        ["@neorg.todo_items.uncertain.norg"] = { fg = "#FFFFFF" },
                        ["@neorg.todo_items.urgent.norg"] = { fg = "#FFFF00" },
                        ["@neorg.todo_items.recurring.norg"] = { fg = "#00FFFF" },
                        ["@neorg.todo_items.on_hold.norg"] = { fg = "#FFFFFF" },
                        ["@neorg.todo_items.cancelled.norg"] = { fg = "#A1A1A1" },
                    }
                end,
            })

            vim.cmd.colorscheme('dark_flat')

            -- Eviline config for lualine
            -- Author: shadmansaleh
            -- Credit: glepnir
            local lualine = require('lualine')

            -- Color table for highlights
            -- stylua: ignore
            local colors = {
                bg       = '#000000',
                fg       = '#bbc2cf',
                yellow   = '#ECBE7B',
                cyan     = '#008080',
                darkblue = '#081633',
                green    = '#98be65',
                orange   = '#FF8800',
                violet   = '#a9a1e1',
                magenta  = '#c678dd',
                blue     = '#51afef',
                red      = '#ec5f67',
            }

            local conditions = {
                buffer_not_empty = function()
                    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
                end,
                hide_in_width = function()
                    return vim.fn.winwidth(0) > 80
                end,
                check_git_workspace = function()
                    local filepath = vim.fn.expand('%:p:h')
                    local gitdir = vim.fn.finddir('.git', filepath .. ';')
                    return gitdir and #gitdir > 0 and #gitdir < #filepath
                end,
            }

            -- Config
            local config = {
                options = {
                    -- Disable sections and component separators
                    component_separators = '',
                    section_separators = '',
                    theme = {
                        -- We are going to use lualine_c an lualine_x as left and
                        -- right section. Both are highlighted by c theme .  So we
                        -- are just setting default looks o statusline
                        normal = { c = { fg = colors.fg, bg = colors.bg } },
                        inactive = { c = { fg = colors.fg, bg = colors.bg } },
                    },
                },
                sections = {
                    -- these are to remove the defaults
                    lualine_a = {},
                    lualine_b = {},
                    lualine_y = {},
                    lualine_z = {},
                    -- These will be filled later
                    lualine_c = {},
                    lualine_x = {},
                },
                inactive_sections = {
                    -- these are to remove the defaults
                    lualine_a = {},
                    lualine_b = {},
                    lualine_y = {},
                    lualine_z = {},
                    lualine_c = {},
                    lualine_x = {},
                },
            }

            -- Inserts a component in lualine_c at left section
            local function ins_left(component)
                table.insert(config.sections.lualine_c, component)
            end

            -- Inserts a component in lualine_x at right section
            local function ins_right(component)
                table.insert(config.sections.lualine_x, component)
            end

            -- ins_left {
            --     function()
            --         return '▊'
            --     end,
            --     color = { fg = colors.blue }, -- Sets highlighting of component
            --     padding = { left = 0, right = 1 }, -- We don't need space before this
            -- }

            ins_left {
                -- mode component
                function()
                    return ''
                end,
                color = function()
                    -- auto change color according to neovims mode
                    local mode_color = {
                        n = colors.red,
                        i = colors.green,
                        v = colors.blue,
                        [''] = colors.blue,
                        V = colors.blue,
                        c = colors.magenta,
                        no = colors.red,
                        s = colors.orange,
                        S = colors.orange,
                        [''] = colors.orange,
                        ic = colors.yellow,
                        R = colors.violet,
                        Rv = colors.violet,
                        cv = colors.red,
                        ce = colors.red,
                        r = colors.cyan,
                        rm = colors.cyan,
                        ['r?'] = colors.cyan,
                        ['!'] = colors.red,
                        t = colors.red,
                    }
                    return { fg = mode_color[vim.fn.mode()] }
                end,
                padding = { right = 1 },
            }

            ins_left {
                -- filesize component
                'filesize',
                cond = conditions.buffer_not_empty,
            }

            ins_left {
                'filename',
                cond = conditions.buffer_not_empty,
                color = { fg = colors.magenta, gui = 'bold' },
            }

            ins_left { 'location' }

            ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

            ins_left {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = { error = ' ', warn = ' ', info = ' ' },
                diagnostics_color = {
                    error = { fg = colors.red },
                    warn = { fg = colors.yellow },
                    info = { fg = colors.cyan },
                },
            }

            -- Insert mid section. You can make any number of sections in neovim :)
            -- for lualine it's any number greater then 2
            ins_left {
                function()
                    return '%='
                end,
            }

            ins_left {
                -- Lsp server name .
                function()
                    local msg = 'No Active Lsp'
                    local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
                    local clients = vim.lsp.get_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return msg
                end,
                icon = ' LSP:',
                color = { fg = '#ffffff', gui = 'bold' },
            }

            -- Add components to right sections
            ins_right {
                'o:encoding', -- option component same as &encoding in viml
                fmt = string.upper, -- I'm not sure why it's upper case either ;)
                cond = conditions.hide_in_width,
                color = { fg = colors.green, gui = 'bold' },
            }

            ins_right {
                'fileformat',
                fmt = string.upper,
                icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
                color = { fg = colors.green, gui = 'bold' },
            }

            ins_right {
                'branch',
                icon = '',
                color = { fg = colors.violet, gui = 'bold' },
            }

            ins_right {
                'diff',
                -- Is it me or the symbol for modified us really weird
                symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
                diff_color = {
                    added = { fg = colors.green },
                    modified = { fg = colors.orange },
                    removed = { fg = colors.red },
                },
                cond = conditions.hide_in_width,
            }

            -- ins_right {
            --     function()
            --         return '▊'
            --     end,
            --     color = { fg = colors.blue },
            --     padding = { left = 1 },
            -- }

            -- Now don't forget to initialize lualine
            lualine.setup(config)
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
