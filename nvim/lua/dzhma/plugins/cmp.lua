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
                    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
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
                    -- format = lspkind.cmp_format({
                    --     mode = 'symbol', -- show only symbol annotations
                    --         maxwidth = 50, 	-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    --                 -- can also be a function to dynamically calculate max width such as 
                    --                 -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
                    --         ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    --         show_labelDetails = true, -- show labelDetails in menu. Disabled by default
                    -- }),
                    fields = { "kind", "abbr", "menu" },
                    format = lspkind.cmp_format({
                        mode = 'symbol', -- show only symbol annotations
                        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        -- can also be a function to dynamically calculate max width such as 
                        -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
                        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                        show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                        -- The function below will be called before any actual modifications from lspkind
                        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                        before = function (entry, vim_item)
                            return vim_item
                        end
                    })
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

    {
        'hinell/lsp-timeout.nvim',				        -- memory management of LSP after inactive period
    },
}
