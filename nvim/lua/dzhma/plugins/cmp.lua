return {
    {
        'neovim/nvim-lspconfig',                        -- LSP integration
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local default_servers = {
                "asm_lsp",
                "clangd",
                "cssls",
                "gopls",
                "html",
                "jdtls",
                "julials",
                "markdown_oxide",
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

            local lsp = require("lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local on_attach = function(client)
                -- Preventing LSP rewriting highlights
                client.server_capabilities.semanticTokensProvider = false
            end

            for _, server in ipairs(default_servers) do
                lsp[server].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                }
            end

            lsp.lua_ls.setup {
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

            vim.keymap.set('n', '<Space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '<Leader>p', vim.diagnostic.goto_prev)
            vim.keymap.set('n', '<Leader>n', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<Space>q', vim.diagnostic.setloclist)
        end,
    },

    {
        "hrsh7th/nvim-cmp",				                -- autocomplete function
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",				            -- autocomplete integration
            "hrsh7th/cmp-buffer",				            -- source of coding information for autocomplete to pull
            "hrsh7th/cmp-path",				                -- source of file path information for autocomplete to pull
            "hrsh7th/cmp-cmdline",				            -- autocomplete integration inside cmdline
            "saadparwaiz1/cmp_luasnip",			            -- linker between autocomplete & LuaSnip
            "L3MON4D3/LuaSnip",				                -- code snippets to give code information from LSP
            "rafamadriz/friendly-snippets",			        -- snippet collection for a range of programming languages
            "onsails/lspkind.nvim",				            -- devicon integration into LSP autocomplete
            "roobert/tailwindcss-colorizer-cmp.nvim",
            "f3fora/cmp-spell",                             -- dictionary autocompletion
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()

            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")
            local tailwindcss_colorizer_cmp = require("tailwindcss-colorizer-cmp")

            cmp.setup({
                window = {
                    completion = {
                        border = "rounded",     -- single|rounded|none
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
                    {
                        name = "spell",
                        option = {
                            keep_all_entries = false,
                            enable_in_context = function ()
                                return true
                            end,
                            preselect_correct_word = true,
                        },
                    },
                }),
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, item)
                        -- VSCode like icons for cmp autocompletion
                        local fmt = lspkind.cmp_format({
                            mode = "symbol_text",
                            maxwidth = 50,
                            ellipsis_char = "...",
                            before = tailwindcss_colorizer_cmp.formatter, -- prepend tailwindcss-colorizer
                        })(entry, item)

                        -- customize lspkind format
                        local strings = vim.split(fmt.kind, "%s", { trimempty = true })

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
