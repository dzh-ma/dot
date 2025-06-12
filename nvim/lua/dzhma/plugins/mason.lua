return {
    -- DOCS: Parser package manager
    {
        'williamboman/mason.nvim',                  -- LSP/DAP/linter/formatter installer
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            'williamboman/mason-lspconfig.nvim',    -- linker between Mason installed LSPs & LSP integration
        },
        config = function()
            require("mason").setup()

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "asm_lsp",
                    "clangd",
                    "cssls",
                    "gopls",
                    "html",
                    "jdtls",
                    "lua_ls",
                    "millet",
                    "phpactor",
                    "pyright",
                    "solargraph",
                    "rust_analyzer",
                    "tinymist",
                    "ts_ls",
                    "yamlls",
                    "zls",
                },
            })
        end,
    }
}
