return {
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
                    "clangd",
                    "cssls",
                    "gopls",
                    "html",
                    "julials",
                    "jdtls",
                    "ocamllsp",
                    "pyright",
                    "rust_analyzer",
                    "zls",
                },
            })
        end,
    }
}
