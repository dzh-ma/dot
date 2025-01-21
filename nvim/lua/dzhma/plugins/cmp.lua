return {
    {
        'neovim/nvim-lspconfig',                        -- LSP integration
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local on_attach = function(client)
                client.server_capabilities.semanticTokensProvider = false       -- to prevent LSP overwriting Treesitter highlighting
            end

            require("lspconfig").asm_lsp.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").clangd.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").cssls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").gopls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").html.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").jdtls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").julials.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").lua_ls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            }
            require("lspconfig").millet.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").phpactor.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").pyright.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").solargraph.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").rust_analyzer.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").tinymist.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").ts_ls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").yamlls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").zls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }

            vim.keymap.set('n', '<Space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '<Leader>p', vim.diagnostic.goto_prev)
            vim.keymap.set('n', '<Leader>n', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<Space>q', vim.diagnostic.setloclist)
        end,
    },

    {
        'hrsh7th/nvim-cmp',				                -- autocomplete function
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',				            -- autocomplete integration
            'hrsh7th/cmp-buffer',				            -- source of coding information for autocomplete to pull
            'hrsh7th/cmp-path',				                -- source of file path information for autocomplete to pull
            'hrsh7th/cmp-cmdline',				            -- autocomplete integration inside cmdline
            'saadparwaiz1/cmp_luasnip',			            -- linker between autocomplete & LuaSnip
            'L3MON4D3/LuaSnip',				                -- code snippets to give code information from LSP
            'rafamadriz/friendly-snippets',			        -- snippet collection for a range of programming languages
            'onsails/lspkind.nvim',				            -- devicon integration into LSP autocomplete
            "roobert/tailwindcss-colorizer-cmp.nvim",
        },
        config = function()
            -- load friendly-snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            -- require cmp
            local cmp = require("cmp")

            -- require luasnip
            local luasnip = require("luasnip")

            -- require lspkind
            local lspkind = require("lspkind")

            -- require tailwind colorizer for cmp
            local tailwindcss_colorizer_cmp = require("tailwindcss-colorizer-cmp")

            -- custom setup
            cmp.setup({
                window = {
                    completion = {
                        border = "rounded", -- single|rounded|none
                        -- custom colors
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLineBG,Search:None", -- BorderBG|FloatBorder
                        side_padding = 0, -- padding at sides
                        col_offset = -4, -- move floating box left or right
                    },
                    documentation = {
                        border = "rounded", -- single|rounded|none
                        -- custom colors
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLineBG,Search:None", -- BorderBG|FloatBorder
                    },
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-P>"] = cmp.mapping.select_prev_item(), -- select previous suggestion
                    ["<S-TAB>"] = cmp.mapping.select_prev_item(), -- select previous suggestion (2)
                    ["<C-n>"] = cmp.mapping.select_next_item(), -- select next suggestion
                    ["<TAB>"] = cmp.mapping.select_next_item(), -- select next suggestion (2)
                    ["<C-L>"] = cmp.mapping.scroll_docs(-4), -- scroll docs down
                    ["<C-H>"] = cmp.mapping.scroll_docs(4), -- scroll docs up
                    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                    ["<C-Space>"] = cmp.mapping.complete( { select = true } ), -- show completion suggestions
                    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirm suggestion
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" }, -- lsp
                    { name = "luasnip" }, -- luasnips
                    { name = "buffer" }, -- text within the current buffer
                    { name = "path" }, -- file system paths
                }),
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, item)
                        -- vscode like icons for cmp autocompletion
                        local fmt = lspkind.cmp_format({
                            mode = "symbol_text",
                            maxwidth = 50,
                            ellipsis_char = "...",
                            before = tailwindcss_colorizer_cmp.formatter, -- prepend tailwindcss-colorizer
                        })(entry, item)

                        -- customize lspkind format
                        local strings = vim.split(fmt.kind, "%s", { trimempty = true })

                        -- strings[1] -> default icon
                        -- strings[2] -> kind

                        -- set different icon styles
                        -- fmt.kind = " " .. (cmp_kinds[strings[2]] or "") -- concatenate icon based on kind

                        -- append customized kind text
                        fmt.kind = fmt.kind .. " " -- just an extra space at the end
                        fmt.menu = strings[2] ~= nil and ("  " .. (strings[2] or "")) or ""

                        return fmt
                    end,
                },
            })

            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" }, -- for searching text in the buffer
                },
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" }, -- file system paths
                }, {
                        { name = "cmdline" }, -- Neovim's command-line suggestions
                    }),
            })
        end,
    },
}
