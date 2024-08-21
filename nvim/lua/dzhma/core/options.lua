-- UI essentials
vim.o.number = true             -- numbered columns (effective on current line)
vim.o.relativenumber = true     -- relative numbered colums
vim.o.termguicolors = true
vim.cmd[["syntax enable"]]
vim.opt.cursorline = false
vim.opt.wrap = false            -- disables ugly screen wrapping
vim.opt.signcolumn = "yes"      -- prevents screen jumping right when LSP issue is raised
--vim.opt.linespace = -5

vim.o.shiftwidth = 4
vim.o.tabstop = 4                                               -- consistent tabbing
vim.o.expandtab = true                                          -- uses spaces instead of tab

vim.o.clipboard = "unnamedplus"

vim.opt.scrolloff = 999
vim.opt.sidescrolloff = 999

vim.opt.laststatus = 0
vim.opt.showtabline = 0

-- indentation
local opt = vim.opt
local cmd = vim.cmd
local api = vim.api
local nvim_create_autocmd = api.nvim_create_autocmd
local nvim_set_hl = api.nvim_set_hl

opt.list = true

local space = "·"
opt.listchars:append {
	tab = "│─",
	multispace = space,
	lead = space,
	trail = space,
	nbsp = space
}

cmd([[match TrailingWhitespace /\s\+$/]])

nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })

nvim_create_autocmd("InsertEnter", {
	callback = function()
		opt.listchars.trail = nil
		nvim_set_hl(0, "TrailingWhitespace", { link = "Whitespace" })
	end
})

nvim_create_autocmd("InsertLeave", {
	callback = function()
		opt.listchars.trail = space
		nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
	end
})
