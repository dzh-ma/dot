-- UI essentials
vim.cmd[["syntax enable"]]
vim.o.number = true                 -- numbered columns (effective on current line)
vim.o.relativenumber = true         -- relative numbered columns
vim.o.termguicolors = true
vim.opt.cursorline = false
vim.opt.wrap = false                -- disables ugly screen wrapping
vim.opt.signcolumn = "yes"          -- prevents screen jumping right when LSP issue is raised
vim.opt.conceallevel = 3
vim.opt.concealcursor = "cn"
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

vim.o.shiftwidth = 4
vim.o.tabstop = 4                   -- consistent tabbing
vim.o.expandtab = true              -- uses spaces instead of tab

vim.o.clipboard = "unnamedplus"     -- copy/paste support

-- cursor lock
vim.opt.scrolloff = 999
vim.opt.sidescrolloff = 999

-- menu line appearance
vim.opt.laststatus = 0
vim.opt.showtabline = 0

-- neovide settings
vim.g.neovide_cursor_animation_length = 0.13
vim.g.neovide_cursor_trail_size = 0.4
vim.g.neovide_cursor_smooth_blink = true
vim.g.neovide_cursor_vfx_mode = "wireframe"

vim.g.loaded_perl_provider = 0
