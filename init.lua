-- filepath: ~/.config/nvim/init.lua
vim.opt.number = true  -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.termguicolors = true -- Enable true color support

-- Key mappings (example)
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex) -- Open netrw (file explorer)
