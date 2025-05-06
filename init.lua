-- Plugin management with lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
    vim.cmd [[packadd lazy.nvim]]
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins") -- Load plugins from plugins.lua

-- Settings (must be after plugin setup)
-- filepath: ~/.config/nvim/init.lua

vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = false -- Show relative line numbers
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.termguicolors = true -- Enable true color support

-- Key mappings (example)
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex) -- Open netrw (file explorer)

-- Save keymap
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = "Save in normal mode" })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', { desc = "Save while in insert mode" })
-- Quit keymap
vim.keymap.set('n', '<C-q>', ':q<CR>', { desc = "Quit" })
-- Move to next buffer
vim.keymap.set('n', '<A-Right>', ':bnext<CR>', { desc = "Next buffer" })
vim.keymap.set('n', '<A-l>', ':bnext<CR>', { desc = "Next buffer" })
-- Move to previous buffer
vim.keymap.set('n', '<A-Left>', ':bprevious<CR>', { desc = "Previous buffer" })
vim.keymap.set('n', '<A-h>', ':bprevious<CR>', { desc = "Previous buffer" })

-- Move line up/down in Normal mode
vim.keymap.set('n', '<A-Up>', ':m .-2<CR>', { desc = "Move line up" })
vim.keymap.set('n', '<A-Down>', ':m .+1<CR>', { desc = "Move line down" })

-- Move selected lines up/down in Visual mode
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })

-- Toggle comment in Normal and Visual mode
vim.keymap.set("n", "<C-/>", function() require('Comment.api').toggle.linewise.current() end, { desc = "Toggle comment current line", noremap = true, silent = true })
vim.keymap.set("v", "<C-/>", function() require('Comment.api').toggle.linewise(vim.fn.visualmode()) end, { desc = "Toggle comment selected lines", noremap = true, silent = true })



-- Define a keymap to toggle nvim-tree
vim.keymap.set('n', '<leader>e', require("nvim-tree.api").tree.toggle, { desc = "Toggle nvim-tree" })

-- File finder (like Ctrl+P in VS Code)
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = "Find files" })

-- Auto format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = ":lua print('Formatting on save!') vim.lsp.buf.format()",
})
