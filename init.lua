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
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>')
-- Quit keymap
vim.keymap.set('n', '<C-q>', ':q<CR>')

-- Toggle comment for visual mode
-- vim.keymap.set('v', '<C-/>', function()
--   -- Get the selected lines
--   local start_line = vim.fn.line("'<")
--   local end_line = vim.fn.line("'>")

--   -- Get the comment string for the current filetype
--   local comment_string = vim.api.nvim_eval('&commentstring')
--   local uncomment_string = string.gsub(comment_string, '%%s', '')

--   -- Check if the first line is commented or not
--   if start_line > 0 and end_line > 0 then -- Check if the buffer is not empty
--     vim.api.nvim_win_set_cursor(0, {start_line, 0})
--     vim.cmd("normal ^")
--     local current_line = vim.fn.getline('.')
--     local is_commented = string.sub(current_line, 1, string.len(uncomment_string)) == uncomment_string

--     -- Toggle comment for each line
--     for line = start_line, end_line do
--       if line <= vim.fn.line("$") then  -- Check if the line exists
--         vim.api.nvim_win_set_cursor(0, {line, 0})
--         vim.cmd("normal ^")
--         local current_line = vim.fn.getline('.')

--         if is_commented then
--           -- Uncomment the line
--           if string.sub(current_line, 1, string.len(uncomment_string)) == uncomment_string then
--             local uncommented_line = string.sub(current_line, string.len(uncomment_string) + 1)
--             vim.api.nvim_put({uncommented_line}, 'l', false, true)
--           end
--         else
--           -- Comment the line
--           vim.api.nvim_put({uncomment_string}, 'l', false, true)
--         end
--       end
--     end
--   end
-- end)

-- Auto format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = ":lua vim.lsp.buf.format()",
})

