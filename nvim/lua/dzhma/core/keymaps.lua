-- leader & : ease of use
vim.g.mapleader = " "                                           -- leader mapped to <Space>
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })      -- colon commands mapped to semicolon for accessibility

-- stack pane navigation
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })               -- moving down a pane from normal mode
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })               -- moving up a pane from normal mode
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })               -- moving left a pane from normal mode
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })               -- moving right a pane from normal mode
vim.keymap.set('n', '<C-n>', '<cmd>bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-p>', '<cmd>bprevious<CR>', { noremap = true, silent = true })
-- exiting terminal mode
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-j>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-k>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-h>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-l>', { noremap = true, silent = true })

-- word search and buffer deletion
vim.keymap.set('n', '<Leader>c', '<cmd>noh<CR>', { noremap = true, silent = true})          -- cancels search highlighting
vim.keymap.set('n', '<Leader>b', '<cmd>bdelete<CR>', { noremap = true, silent = true})          -- regular buffer deletion
