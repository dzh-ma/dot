return {
    {
        'EtiamNullam/white-chocolate.nvim',
        priority = 1000,
        dependencies = {
            'windwp/windline.nvim',
        },
        config = function()
            require('white-chocolate').setup()

            require('wlsample.evil_line')
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
