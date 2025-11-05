-- UI essentials
vim.cmd[["syntax enable"]]
vim.o.number = true                 -- numbered columns (effective on current line)
vim.o.relativenumber = true         -- relative numbered columns
vim.o.termguicolors = true
vim.opt.cursorline = false
vim.opt.wrap = false                -- disables ugly screen wrapping
vim.opt.signcolumn = "yes"          -- prevents screen jumping right when LSP issue is raised
vim.opt.conceallevel = 3
-- vim.opt.concealcursor = "cn"
vim.opt.spell = false
vim.opt.spelllang = { "en_us" }

vim.o.shiftwidth = 4
vim.o.tabstop = 4                   -- consistent tabbing
vim.o.expandtab = true              -- uses spaces instead of tab

vim.o.clipboard = "unnamedplus"     -- copy/paste support

-- cursor lock
vim.opt.scrolloff = 999
-- vim.opt.sidescrolloff = 999

-- menu line appearance
vim.opt.laststatus = 0
vim.opt.showtabline = 0

vim.g.loaded_perl_provider = 0

-- changing indentation rules
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "css", "javascript", "javascriptreact", "ruby", "typescriptreact" },
    callback = function()
        vim.bo.shiftwidth = 2
        vim.bo.tabstop = 2
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "r" },
    callback = function()
        vim.bo.shiftwidth = 5
        vim.bo.tabstop = 5
    end,
})

-- disabling spellchecking on terminal
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.opt_local.spell = false
    end,
})

-- spellchecking enabled only during note taking & documentation
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "markdown", "md" },
--     callback = function ()
--         vim.opt_local.spell = true
--     end,
-- })

-- Save the original vim.ui.open
local orig_ui_open = vim.ui.open

-- Helper function to resolve a target to an absolute path
local function resolve_target(target)
    -- If target starts with a slash or a protocol (e.g. http://), assume it's already absolute.
    if target:match("^/") or target:match("^[a-z]+://") then
        return target
    else
        -- Resolve relative path with respect to the current file's directory
        return vim.fn.expand("%:p:h") .. "/" .. target
    end
end

vim.ui.open = function(target, opts, on_open)
    local resolved_target = resolve_target(target)
    local lower_target = resolved_target:lower()
    if lower_target:match("%.pdf$") then
        vim.fn.jobstart("zathura " .. vim.fn.shellescape(resolved_target), { detach = true })
        if on_open then on_open() end
    elseif lower_target:match("%.png$") or lower_target:match("%.jpe?g$") or
        lower_target:match("%.gif$") or lower_target:match("%.bmp$") or
        lower_target:match("%.svg$") then
        vim.fn.jobstart("imv " .. vim.fn.shellescape(resolved_target), { detach = true })
        if on_open then on_open() end
    else
        orig_ui_open(target, opts, on_open)
    end
end

-- Place this code somewhere after your plugin manager setup,
-- for example, in your init.lua or a dedicated autocmds.lua file.

-- Create a dedicated group for clarity and easy clearing
local neorg_hl_group = vim.api.nvim_create_augroup("NeorgHighlightOverrides", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = neorg_hl_group,
  pattern = "norg", -- Trigger only for Neorg files
  callback = function()
    -- Set the @operator.latex highlight to match your desired style
    vim.api.nvim_set_hl(0, "@operator.latex", {
      fg = "#000000",    -- Match @neorg.markup.inline_math.norg foreground
      bg = "#fd5e3a",    -- Match @neorg.markup.inline_math.norg background
      italic = true,  -- Match @neorg.markup.inline_math.norg style
      default = true  -- Important: ensures this overrides theme defaults
    })
  end,
})
