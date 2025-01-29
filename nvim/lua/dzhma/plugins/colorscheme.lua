return {
    {
        'EtiamNullam/white-chocolate.nvim',
        priority = 1000,
        config = function()
            require('white-chocolate').setup()
            vim.api.nvim_set_hl(0, "@markup.strong.markdown_inline", { fg = "#1aa7d6", bold = true })
            vim.api.nvim_set_hl(0, "@markup.italic.markdown_inline", { fg = "#69b98b", italic = true })
        end,
    },

    -- {
    --     "uncleTen276/dark_flat.nvim",
    --     dependencies = {
    --         "tamton-aquib/staline.nvim",
    --         "windwp/windline.nvim",
    --     },
    --     config = function ()
    --         require("dark_flat").setup({
    --             transparent = true,
    --
    --             themes = function (colors)
    --                 return {
    --                     -- General Highlighting
    --                     ["@variable"] = { fg = "#41FDFE", bold = true },
    --                     ["Structure"] = { fg = colors.dark_cyan },
    --                     ["Function"] = { fg = "#0ADD08", underline = true },
    --                     ["LineNr"] = { fg = "#FF0000" },
    --                     ["String"] = { fg = "#FFFF00" },
    --                     ["Keyword"] = { fg = "#FF0000" },
    --
    --                     -- General Markup Highlighting
    --                     ["@markup.strong"] = { fg = "#FF0000", bold = true },
    --                     ["@markup.italic"] = { fg = "#FFFF00", italic = true },
    --                     ["@markup.list.markdown"] = { fg = "#FF0000", bold = true },
    --
    --                     -- Markdown Highlighting
    --                     ["@markup.heading.1.markdown"] = { fg = "#FF4500", bg = "#2B1C17", bold = true }, -- Heading 1
    --                     ["@markup.heading.2.markdown"] = { fg = "#FFD700", bg = "#2F2B17", bold = true }, -- Heading 2
    --                     ["@markup.heading.3.markdown"] = { fg = "#32CD32", bg = "#1C2B1C", bold = true }, -- Heading 3
    --                     ["@markup.heading.4.markdown"] = { fg = "#00CED1", bg = "#172B2B", bold = true }, -- Heading 4
    --                     ["@markup.heading.5.markdown"] = { fg = "#9370DB", bg = "#1F1C2B", bold = true }, -- Heading 5
    --                     ["@markup.heading.6.markdown"] = { fg = "#FF69B4", bg = "#2B1721", bold = true }, -- Heading 6
    --                     ["RenderMarkdownH1Bg"] = { bg = "#2B1C17" },
    --                     ["RenderMarkdownH2Bg"] = { bg = "#2F2B17" },
    --                     ["RenderMarkdownH3Bg"] = { bg = "#1C2B1C" },
    --                     ["RenderMarkdownH4Bg"] = { bg = "#172B2B" },
    --                     ["RenderMarkdownH5Bg"] = { bg = "#1F1C2B" },
    --                     ["RenderMarkdownH6Bg"] = { bg = "#2B1721" },
    --                     ["@markup.quote.markdown"] = { fg = "#81D8D0" },
    --
    --                     -- Git Side Highlighting
    --                     ["GitSignsAdd"] = { fg = "#FF0000" },
    --                     ["GitSignsChange"] = { fg = "#FF0000" },
    --                     ["GitSignsDelete"] = { fg = "#FF0000" },
    --                     ["GitSignsTopdelete"] = { fg = "#FF0000" },
    --                     ["GitSignsChangedelete"] = { fg = "#FF0000" },
    --                     ["GitSignsUntracked"] = { fg = "#FF0000" },
    --                 }
    --             end,
    --         })
    --
    --         require("wlsample.evil_line")
    --
    --         require("stabline").setup {
    --             style       = "bar",        -- arrow/slant/bubble/bar
    --             fg          = "#FFFFFF",
    --             bg          = "#000000",
    --             inactive_bg = "#000000",
    --             inactive_fg = "#aaaaaa",
    --             font_active = "bold",
    --             exclude_fts = { 'NvimTree', 'dashboard', 'lir' },
    --             stab_left   = " ",
    --             stab_right  = " ",
    --             stab_start  = "",
    --             stab_end    = "",
    --         }
    --     end,
    -- },

    {
        "shellRaining/hlchunk.nvim",
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        config = function()
            require("hlchunk").setup({
                chunk = {
                    enable = true,
                    style = {
                        { fg = "#ff0000" },
                        { fg = "#ff0000" },
                    },
                    delay = 0,
                    duration = 0,
                },
                indent = {
                    enable = true,
                },
                line_num = {
                    enable = true,
                    style = "#ff0000",
                }
            })
        end
    },

    {
        "HiPhish/rainbow-delimiters.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
