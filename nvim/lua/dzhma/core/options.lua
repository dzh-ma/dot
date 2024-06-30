-- UI essentials
vim.o.number = true             -- numbered columns (effective on current line)
vim.o.relativenumber = true     -- relative numbered colums
vim.o.termguicolors = true
vim.cmd[["syntax enable"]]
vim.opt.wrap = false            -- disables ugly screen wrapping
vim.opt.signcolumn = "yes"      -- prevents screen jumping right when LSP issue is raised

vim.o.shiftwidth = 4
vim.o.tabstop = 4                                               -- consistent tabbing
vim.o.expandtab = true                                          -- uses spaces instead of tab

vim.o.clipboard = "unnamedplus"

vim.opt.scrolloff = 999
-- vim.opt.cursorline = true

vim.opt.laststatus = 2
vim.opt.showtabline = 2
vim.opt.conceallevel = 3
