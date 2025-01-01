return {
    {
        "diegoulloao/neofusion.nvim",
        priority = 1000,
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "nvim-tree/nvim-web-devicons",
            "folke/noice.nvim"
        },
        config = function()
            require("neofusion").setup({
                overrides = {
                    ["@markup.heading.1.markdown"] = {
                        fg = "#ffd700",   -- A pinkish-red tone resembling Heading 1 in the image
                        bg = "#988e75",   -- A darker background for contrast
                        bold = true
                    },
                    -- Header 2
                    ["@markup.heading.2.markdown"] = {
                        fg = "#4ec9b0",   -- A soft beige tone for Heading 2
                        bg = "#869692",   -- A darker blue background
                        bold = true
                    },
                    -- Header 3
                    ["@markup.heading.3.markdown"] = {
                        fg = "#ff8c42",   -- Bright orange-red for Heading 3
                        bg = "#b59e92",   -- Darker red for contrast
                        bold = true
                    },
                    -- Header 4
                    ["@markup.heading.4.markdown"] = {
                        fg = "#ff77a8",   -- Bright greenish-blue for Heading 4
                        bg = "#c9b1b8",   -- A darker teal background
                        bold = true
                    },
                    -- Header 5
                    ["@markup.heading.5.markdown"] = {
                        fg = "#7ac2e4",   -- Vibrant cyan for Heading 5
                        bg = "#354859",   -- A very dark cyan background
                        bold = true
                    },
                    -- Header 6
                    ["@markup.heading.6.markdown"] = {
                        fg = "#a7acdd",   -- Purple-pink for Heading 6
                        bg = "#40445c",   -- Darker purple for contrast
                        bold = true
                    },
                    -- Bold Text
                    ["@markup.strong.markdown_inline"] = {
                        fg = "#FFC500",   -- Matches Heading 1 for bold emphasis
                        bold = true,
                        underline = true,
                    },
                    -- Italic Text
                    ["@markup.italic.markdown_inline"] = {
                        fg = "#FF0000",   -- Matches Heading 5 for italic text
                        italic = true,
                        underline = true,
                    },
                    ["@variable.parameter"] = {
                        fg = "#D2A6A8",
                        italic = true,
                    },
                    ["@variable.member"] = {
                        fg = "#4682b4",
                    },
                    ["@function.method.call"] = {
                        fg = "#8FBC8F",
                        bold = true,
                    },
                    ["@string"] = {
                        fg = "#FFD700",
                        italic = true,
                    },
                    ["@function"] = {
                        fg = "#FF77A8",
                        bold = true,
                        underline = true,
                    },
                    ["@function.call"] = {
                        fg = "#FF77A8",
                        bold = true,
                        underline = true,
                    },
                    ["@constant"] = {
                        fg = "#D2A6A8",
                    },
                    ["@property"] = {
                        fg = "#34243E",
                        italic = true,
                    },
                    ["Oilfile"] = {
                        fg = "#FF8C42",
                        italic = true,
                    },
                    ["@keyword.modifier"] = {
                        fg = "#FFFFF0",
                        bold = true,
                    },
                    ["@type"] = {
                        fg = "#FFA726",
                        underline = true,
                        bold = true,
                    }
                }
            })

            vim.o.background = "dark"
            vim.cmd.colorscheme "neofusion"

            local noice = require("noice")
            local lazy_status = require("lazy.status")

            -- custom setup
            require("lualine").setup({
                options = {
                    theme = require("neofusion.lualine"),
                    globalstatus = true,
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = { "dashboard", "packer", "help" },
                    ignore_focus = {}, -- add filetypes inside
                },
                -- man:124 for sections doc
                sections = {
                    lualine_a = { "progress" }, -- disable vim mode viewer
                    lualine_b = {
                        {
                            "branch",
                            icon = "", -- disable icon
                            padding = { left = 1, right = 1 },
                        },
                    },
                    lualine_c = {
                        -- filetype icon
                        {
                            "filetype",
                            icon_only = true,
                            padding = { left = 2, right = 0 },
                            color = "_lualine_c_filetype",
                        },
                        -- filename
                        {
                            "filename",
                            file_status = true, -- display file status (read only, modified)
                            path = 1, -- 0: just name, 1: relative path, 2: absolute path, 3: absolute path with ~ as home directory
                            symbols = {
                                unnamed = "",
                                readonly = "",
                                modified = "",
                            },
                            padding = { left = 1 },
                            color = { gui = "bold" },
                        },
                    },
                    lualine_x = {
                        {
                            lazy_status.updates,
                            cond = lazy_status.has_updates,
                        },
                        -- number of changes in file
                        {
                            "diff",
                            colored = true,
                            padding = { right = 2 },
                            symbols = {
                                added = "+",
                                modified = "|",
                                removed = "-",
                            },
                        },
                        -- status like @recording
                        {
                            noice.api.statusline.mode.get,
                            cond = noice.api.statusline.mode.has,
                        },
                    },
                    lualine_y = {},
                    lualine_z = { "location" },
                },
                extensions = {
                    "nvim-tree",
                    "toggleterm",
                    "mason",
                    "fzf",
                    "quickfix",
                    "man",
                    "lazy",
                },
            })
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

    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- require bufferline
            local bufferline = require("bufferline")

            -- custom setup
            bufferline.setup({
                options = {
                    mode = "buffers", -- only show tabs and not all buffers
                    numbers = "ordinal", -- add tabs ordinal numbers
                    style_preset = bufferline.style_preset.default, -- default|minimal
                    color_icons = true,
                    tab_size = 22,
                    close_icon = "",
                    show_buffer_icons = true,
                    show_duplicate_prefix = true, -- show base path if tabs have the same name
                    separator_style = "thick", -- slant|slope|thick|thin|{"|", "|"}
                    diagnostics = "nvim_lsp", -- nvim lsp diagnostics integration in tabs or false
                    indicator = {
                        style = "icon", -- icon|underline|none
                    },
                    offsets = {
                        -- avoid to show bufferline on top nvim-tree
                        {
                            filetype = "NvimTree",
                            text = "File Explorer", -- title on top
                            highlight = "Directory",
                            separator = true, -- true is the default, or set custom
                        },
                        -- avoid to show bufferline on top saga outline symbols
                        {
                            filetype = "sagaoutline",
                            text = "Symbols", -- title on top
                            highlight = "Directory",
                            separator = true, -- true is the default, or set custom
                        },
                    },
                    diagnostics_indicator = function(count) -- diagnostics format
                        return " " .. count
                    end,
                    -- exclude some buffer and file types
                    custom_filter = function(buf_number)
                        local buftype = vim.api.nvim_buf_get_option(buf_number, "buftype")
                        local filetype = vim.api.nvim_buf_get_option(buf_number, "filetype")

                        -- exclude list
                        local excluded_filetypes = {
                            ["terminal"] = true,
                            ["TelescopePrompt"] = true,
                            ["NvimTree"] = true,
                            ["sagaoutline"] = true,
                            ["sagafinder"] = true,
                            ["starter"] = true,
                        }

                        local excluded_buftypes = {
                            ["nofile"] = true,
                            ["terminal"] = true,
                        }

                        return not excluded_buftypes[buftype] and not excluded_filetypes[filetype]
                    end,
                },
            })
        end,
    },
}
