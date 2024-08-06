return {
    {
        'neovim/nvim-lspconfig',			            -- LSP integration
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
            require("lspconfig").markdown_oxide.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").ocamllsp.setup {
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
            require("lspconfig").tsserver.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            require("lspconfig").typst_lsp.setup {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    exportPdf = "never"
                }
            }
            require("lspconfig").rust_analyzer.setup {
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
        },
        config = function()
            local cmp = require'cmp'
            local lspkind = require('lspkind')

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                    completion = {
                        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                        col_offset = -3,
                        side_padding = 0,
                    },
                },
                mapping = cmp.mapping.preset.insert({
                    -- ['<C-k>'] = cmp.mapping.scroll_docs(-4),
                    -- ['<C-l>'] = cmp.mapping.scroll_docs(4),
                    --['<C-Space>'] = cmp.mapping.complete(),
                    -- ['<C-e>'] = cmp.mapping.abort(),
                    ['<C-Space>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    --['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                    { name = 'neorg' },
                }, {
                        { name = 'buffer' },
                    }),
                formatting = {
                    format = function(entry, item)
                        local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
                        item = require("lspkind").cmp_format({
                            -- any lspkind format settings here
                        })(entry, item)
                        if color_item.abbr_hl_group then
                            item.kind_hl_group = color_item.abbr_hl_group
                            item.kind = color_item.abbr
                        end
                        return item
                    end
                },
                experimental = {
                    ghost_text = true,
                },
            })
            -- Set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
                }, {
                        { name = 'buffer' },
                    })
            })
            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })
            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                        { name = 'cmdline' }
                    })
            })

            vim.diagnostic.config { virtual_text = true }
        end,
    },
}
