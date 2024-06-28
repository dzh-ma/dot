return {
    {
        'williamboman/mason.nvim',			            -- LSP/DAP/linter/formatter installer
        dependencies = {
            'williamboman/mason-lspconfig.nvim',		    -- linker between Mason installed LSPs & LSP integration
        },
        config = function()
            require("mason").setup()

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "cssls",
                    "gopls",
                    "html",
                    "julials",
                    "jdtls",
                    "ocamllsp",
                    "pyright",
                    "tsserver",
                    "rust_analyzer",
                    "zls",
                },
            })
        end,
    }
}
