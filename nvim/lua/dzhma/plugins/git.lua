return {
    -- {
    --     "kdheepak/lazygit.nvim",
    --     lazy = true,
    --     cmd = {
    --         "LazyGit",
    --         "LazyGitConfig",
    --         "LazyGitCurrentFile",
    --         "LazyGitFilter",
    --         "LazyGitFilterCurrentFile",
    --     },
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --     },
    --     keys = {
    --         { "<Leader>g", "<cmd>LazyGit<CR>", desc = "LazyGit" },
    --     },
    -- },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
        },
        keys = {
            { "<Leader>g", "<cmd>lua require('neogit').open()<CR>" }
        }
    },
}
