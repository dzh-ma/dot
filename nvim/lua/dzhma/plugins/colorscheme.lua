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
                borderless_pickers = true,
                overrides = function (colors)
                    return {
                        Comment = { fg = colors.grey, italic = true },

                        -- Neorg markup
                        ["@neorg.markup.bold.norg"] = { fg = colors.yellow, bold = true },
                        -- ["@neorg.markup.underline.norg"] = { fg = colors.magenta, underline = true },
                        ["@neorg.markup.variable.norg"] = { fg = colors.cyan , italic = true },
                        ["@neorg.markup.superscript.norg"] = { fg = colors.green },
                        ["@neorg.markup.subscript.norg"] = { fg = colors.red },
                        ["@neorg.markup.verbatim.norg"] = { bg = "#c7c7c7" },

                        -- Neorg footnotes
                        ["@neorg.footnotes.title.norg"] = { fg = colors.cyan, bold = true, italic = true },
                        ["@neorg.footnotes.content.norg"] = { fg = colors.purple, italic = true },
                        ["@neorg.links.location.footnote.norg"] = { fg = colors.cyan, bold = true, italic = true },

                        -- Neorg definitions
                        ["@neorg.definitions.title.norg"] = { fg = colors.yellow, bold = true, italic = true },
                        ["@neorg.definitions.content.norg"] = { fg = colors.pink, italic = true },
                        ["@neorg.links.location.definition.norg"] = { fg = colors.yellow, bold = true, italic = true },

                        -- Neorg metadata
                        ["@neorg.tags.ranged_verbatim.document_meta.title.norg_meta"] = { bold = true, underline = true },
                        ["@neorg.tags.ranged_verbatim.document_meta.key.norg_meta"] = { fg = colors.grey, bold = true },

                        -- Neorg link header titles
                        ["@neorg.links.location.heading.1.norg"] = { fg = colors.bg_alt, bg = colors.red, bold = true, italic = true },
                        ["@neorg.links.location.heading.2.norg"] = { fg = colors.bg_alt, bg = colors.yellow, bold = true, italic = true },
                        ["@neorg.links.location.heading.3.norg"] = { fg = colors.bg_alt, bg = colors.cyan, bold = true, italic = true },
                        ["@neorg.links.location.heading.4.norg"] = { fg = colors.bg_alt, bg = colors.magenta, bold = true, italic = true },
                        ["@neorg.links.location.heading.5.norg"] = { fg = colors.bg_alt, bg = colors.orange, bold = true, italic = true },
                        ["@neorg.links.location.heading.6.norg"] = { fg = colors.bg_alt, bg = colors.green, bold = true, italic = true },

                        -- Neorg link header prefix
                        ["@neorg.links.location.heading.1.prefix.norg"] = { fg = colors.bg_alt, bg = colors.red, bold = true, italic = true },
                        ["@neorg.links.location.heading.2.prefix.norg"] = { fg = colors.bg_alt, bg = colors.yellow, bold = true, italic = true },
                        ["@neorg.links.location.heading.3.prefix.norg"] = { fg = colors.bg_alt, bg = colors.cyan, bold = true, italic = true },
                        ["@neorg.links.location.heading.4.prefix.norg"] = { fg = colors.bg_alt, bg = colors.magenta, bold = true, italic = true },
                        ["@neorg.links.location.heading.5.prefix.norg"] = { fg = colors.bg_alt, bg = colors.orange, bold = true, italic = true },
                        ["@neorg.links.location.heading.6.prefix.norg"] = { fg = colors.bg_alt, bg = colors.green, bold = true, italic = true },

                        -- Neorg header titles
                        ["@neorg.headings.1.title.norg"] = { fg = colors.bg_alt, bg = colors.red, bold = true, italic = true },
                        ["@neorg.headings.2.title.norg"] = { fg = colors.bg_alt, bg = colors.yellow, bold = true, italic = true },
                        ["@neorg.headings.3.title.norg"] = { fg = colors.bg_alt, bg = colors.cyan, bold = true, italic = true },
                        ["@neorg.headings.4.title.norg"] = { fg = colors.bg_alt, bg = colors.magenta, bold = true, italic = true },
                        ["@neorg.headings.5.title.norg"] = { fg = colors.bg_alt, bg = colors.orange, bold = true, italic = true },
                        ["@neorg.headings.6.title.norg"] = { fg = colors.bg_alt, bg = colors.green, bold = true, italic = true },

                        -- Neorg header prefix
                        ["@neorg.headings.1.prefix.norg"] = { fg = colors.bg_alt, bg = colors.red, bold = true, italic = true },
                        ["@neorg.headings.2.prefix.norg"] = { fg = colors.bg_alt, bg = colors.yellow, bold = true, italic = true },
                        ["@neorg.headings.3.prefix.norg"] = { fg = colors.bg_alt, bg = colors.cyan, bold = true, italic = true },
                        ["@neorg.headings.4.prefix.norg"] = { fg = colors.bg_alt, bg = colors.magenta, bold = true, italic = true },
                        ["@neorg.headings.5.prefix.norg"] = { fg = colors.bg_alt, bg = colors.orange, bold = true, italic = true },
                        ["@neorg.headings.6.prefix.norg"] = { fg = colors.bg_alt, bg = colors.green, bold = true, italic = true },

                    }
                end,
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
