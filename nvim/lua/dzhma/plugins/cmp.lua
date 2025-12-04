return {
    -- DOCS: LSP support
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp", -- Add blink.cmp as dependency for LSP capabilities
        },
        config = function()
            local default_servers = {
                "asm_lsp",
                "clangd",
                "cssls",
                "gopls",
                "html",
                "jdtls",
                "millet",
                "phpactor",
                "pyright",
                "solargraph",
                "rust_analyzer",
                "tinymist",
                "ts_ls",
                "yamlls",
                "zls",
            }

            -- Get capabilities from blink.cmp
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            local on_attach = function(client)
                -- Preventing LSP rewriting highlights
                client.server_capabilities.semanticTokensProvider = false
            end

            -- Set up default servers using the new vim.lsp.config API
            for _, server in ipairs(default_servers) do
                vim.lsp.config[server] = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                }
            end

            -- Set up lua_ls with specific settings
            vim.lsp.config.lua_ls = {
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

            -- Enable the configured LSP servers
            for _, server in ipairs(default_servers) do
                vim.lsp.enable(server)
            end
            vim.lsp.enable('lua_ls')
            vim.lsp.enable('r_language_server')

            vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '<Leader>p', vim.diagnostic.goto_prev)
            vim.keymap.set('n', '<Leader>n', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist)
            vim.keymap.set('n', '<Leader>G', vim.lsp.buf.code_action)
        end,
    },

    -- DOCS: nvim-cmp compatibility layer for blink.cmp
    {
        'saghen/blink.compat',
        version = 'v2.*',
        lazy = true,
        opts = {},
    },

    -- DOCS: Auto-completion with blink.cmp
    {
        'saghen/blink.cmp',
        lazy = false, -- lazy loading handled internally
        dependencies = {
            'rafamadriz/friendly-snippets',
            'L3MON4D3/LuaSnip',
            'saghen/blink.compat',
        },
        version = 'v0.*',
        opts = {
            keymap = {
                preset = 'default',
                ['<C-A-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-n>'] = { 'select_next', 'fallback' },
                ['<C-p>'] = { 'select_prev', 'fallback' },
                ['<C-e>'] = { 'hide', 'fallback' },
                ['<C-Space>'] = { 'accept', 'fallback' },
                ['<A-Tab>'] = { 'snippet_forward', 'fallback' },
                ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
                ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
                ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },

            sources = {
                default = { 'lsp', 'path', 'snippets' },
                -- default = { 'lsp', 'path', 'snippets', 'buffer'},
            },

            snippets = {
                expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
                active = function(filter)
                    if filter and filter.direction then
                        return require('luasnip').jumpable(filter.direction)
                    end
                    return require('luasnip').in_snippet()
                end,
                jump = function(direction) require('luasnip').jump(direction) end,
            },

            cmdline = {
                keymap = {
                    preset = "inherit",
                },
                completion = {
                    menu = {
                        auto_show = true
                    },
                },
            },

            completion = {
                accept = {
                    auto_brackets = {
                        enabled = true,
                    },
                },
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    },
                    cycle = {
                        from_bottom = true,
                        from_top = true,
                    },
                },
                menu = {
                    enabled = true,
                    min_width = 15,
                    max_height = 10,
                    border = 'rounded',
                    winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLineBG,Search:None',
                    draw = {
                        align_to = 'label',
                        padding = 1,
                        gap = 1,
                        columns = { 
                            { 'kind_icon' }, 
                            { 'label', 'label_description', gap = 1 }, 
                            { 'kind' } 
                        },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                    update_delay_ms = 50,
                    treesitter_highlighting = true,
                    window = {
                        min_width = 10,
                        max_width = 80,
                        max_height = 20,
                        border = 'rounded',
                        winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLineBG,Search:None',
                    },
                },
                ghost_text = {
                    enabled = false,
                },
            },

            signature = {
                enabled = true,
                window = {
                    min_width = 1,
                    max_width = 100,
                    max_height = 10,
                    border = 'rounded',
                    winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
                },
            },
        },
        config = function(_, opts)
            require('blink.cmp').setup(opts)

            -- Additional LuaSnip keymaps for snippet navigation in select mode
            -- These work alongside the Tab/S-Tab mappings in blink's keymap
            vim.keymap.set({"i", "s"}, "<C-j>", function()
                local ls = require('luasnip')
                if ls.expand_or_jumpable() then
                    ls.expand_or_jump()
                end
            end, { silent = true })

            vim.keymap.set({"i", "s"}, "<C-k>", function()
                local ls = require('luasnip')
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end, { silent = true })

            -- Choice node navigation
            vim.keymap.set({"i", "s"}, "<C-l>", function()
                local ls = require('luasnip')
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end,
    },
}
