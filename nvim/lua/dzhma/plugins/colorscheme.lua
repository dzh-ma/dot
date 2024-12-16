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
                    diagnostics_indicator = function(count, level) -- diagnostics format
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
