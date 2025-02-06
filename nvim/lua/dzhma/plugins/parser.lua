return {
    {
        "nvim-treesitter/nvim-treesitter",          -- parser
        event = "VeryLazy",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "asm", "bash", "c", "c_sharp", "cpp", "css", "dockerfile", "fish",
                    "go", "html", "java", "javascript", "julia", "json", "latex", "lua",
                    "markdown", "markdown_inline", "mermaid", "ocaml", "ocaml_interface",
                    "php", "python", "query", "regex", "ruby", "rust", "sql", "ssh_config",
                    "typescript", "typst", "vim", "vimdoc", "vue", "xml", "yaml", "zig",
                },
                sync_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },

    {
        "CRAG666/code_runner.nvim",				        -- manually programmed code execution using a keyword
        event = "VeryLazy",
        config = function()
            require("code_runner").setup({
                filetype = {
                    c = {
                        --"cd $dir &&",
                        --"gcc $fileName -o $fileNameWithoutExt &&",
                        --"$dir/$fileNameWithoutExt"
                        "cd \"$dir\" &&",
                        "gcc \"$fileName\" -o \"$fileNameWithoutExt\" &&",
                        "\"$dir/$fileNameWithoutExt\""
                    },
                    cpp = {
                        "cd \"$dir\" &&",
                        "g++ \"$fileName\" -o \"$fileNameWithoutExt\" &&",
                        "\"$dir/$fileNameWithoutExt\""
                    },
                    go = "go run",
                    html = "q $file",
                    java = {
                        "cd \"$dir\" &&",
                        "javac \"$fileName\" &&",
                        "java \"$fileNameWithoutExt\" &&",
                    },
                    javascript = "node",
                    julia = "julia",
                    python = {
                        "cd \"$dir\" &&",
                        --"python -u",
                        "python -u \"$fileName\""
                    },
                    typescript = "deno run",
                    ruby = "ruby",
                    tex = "pdflatex \"$fileName\"",
                    typst = {
                        "cd \"$dir\" &&",
                        "typst compile \"$fileName\"",
                    },
                    rust = {
                        "cd \"$dir\" &&",
                        "cargo build &&",
                        "cargo run"
                        --"rustc \"$fileName\" &&",
                        --"\"$dir/$fileNameWithoutExt\""	
                    },
                    zig = "zig run",
                },
            })
            vim.keymap.set("n", "<leader>r", "<cmd>RunCode<CR>", { noremap = true, silent = false })
            vim.keymap.set("n", "<leader>R", "<cmd>RunFile<CR>", { noremap = true, silent = false })
            vim.keymap.set("n", "<leader>b", "<cmd>RunFile tab<CR>", { noremap = true, silent = false })
        end,
    },

    {
        "mfussenegger/nvim-lint",				        -- linter integration using Mason linters
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("lint").linters_by_ft = {
                python = {"pylint",},
                cpp = {"cpplint",},
                c = {"cpplint",},
                json = { "jsonlint" },
                ruby = {"rubocop",},
                html = {"markuplint",},
                js = {"oxlint",},
                ts = {"oxlint",},
                go = {"staticcheck",},
            }
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
}
