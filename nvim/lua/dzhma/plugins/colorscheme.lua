return {
    {
        'uncleTen276/dark_flat.nvim',
        dependencies = {
            "b0o/incline.nvim",
        },
        config = function ()
            require("dark_flat").setup({
                transparent = true,
                themes = function (colors)
                    return {
                        ["@markup.strong"] = { fg = colors.dark_red, bold = true },
                        ["@markup.italic"] = { fg = colors.light_yellow, italic = true },
                        ["@neorg.markup.underline.norg"] = { fg = colors.green, bold = true, underline = true },
                        ["@neorg.markup.strikethrough.norg"] = { fg = colors.aqua, bold = true },
                        ["@neorg.markup.subscript.norg"] = { bg = colors.dark_gray, fg = colors.red, italic = true },
                        ["@neorg.markup.superscript.norg"] = { bg = colors.dark_gray, fg = colors.dark_cyan, italic = true },
                        ["@neorg.markup.verbatim.norg"] = { fg = colors.peanut, bg = colors.dark_gray },
                        ["@neorg.markup.variable.norg"] = { fg = colors.white, bold = true, underline = true },
                        ["@neorg.markup.inline_math.norg"] = { fg = colors.dark_pink, bg = colors.gray, bold = true },
                        ["@operator.latex"] = { fg = colors.dark_pink },
                        ["@markup.heading.1.markdown"] = { fg = "#FF0000", bg = "#400000", bold = true },
                        ["@markup.heading.2.markdown"] = { fg = "#FFD700", bg = "#5B4A08", bold = true },
                        ["@markup.heading.3.markdown"] = { fg = "#7CFC00", bg = "#013220", bold = true },
                        ["@markup.heading.4.markdown"] = { fg = "#40E0D0", bg = "#065465", bold = true },
                        ["@markup.heading.5.markdown"] = { fg = "#FF8C00", bg = "#B03608", bold = true },
                        ["@markup.heading.6.markdown"] = { fg = "#9370DB", bg = "#301934", bold = true },
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
                    }
                end,
            })

            local devicons = require 'nvim-web-devicons'
            require('incline').setup {
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
                    if filename == '' then
                        filename = '[No Name]'
                    end
                    local ft_icon, ft_color = devicons.get_icon_color(filename)

                    local function get_git_diff()
                        local icons = { removed = '', changed = '', added = '' }
                        local signs = vim.b[props.buf].gitsigns_status_dict
                        local labels = {}
                        if signs == nil then
                            return labels
                        end
                        for name, icon in pairs(icons) do
                            if tonumber(signs[name]) and signs[name] > 0 then
                                table.insert(labels, { icon .. signs[name] .. ' ', group = 'Diff' .. name })
                            end
                        end
                        if #labels > 0 then
                            table.insert(labels, { '┊ ' })
                        end
                        return labels
                    end

                    local function get_diagnostic_label()
                        local icons = { error = '', warn = '', info = '', hint = '' }
                        local label = {}

                        for severity, icon in pairs(icons) do
                            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
                            if n > 0 then
                                table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
                            end
                        end
                        if #label > 0 then
                            table.insert(label, { '┊ ' })
                        end
                        return label
                    end

                    return {
                        { get_diagnostic_label() },
                        { get_git_diff() },
                        { (ft_icon or '') .. ' ', guifg = ft_color, guibg = 'none' },
                        { filename .. ' ', gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
                        { '┊  ' .. vim.api.nvim_win_get_number(props.win), group = 'DevIconWindows' },
                    }
                end,
            }

            vim.cmd.colorscheme('dark_flat')
        end,
    },

    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
