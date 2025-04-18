-- filepath: ~/.config/nvim/lua/plugins.lua
return {
  -- Example plugins
  { "nvim-lua/popup.nvim" },       -- An implementation of the Popup API from vim in Neovim
  { "nvim-lua/plenary.nvim" },     -- Useful lua functions used ny lots of plugins

  -- Colorscheme
  { "luisiacc/gruvbox-baby", lazy = false, priority = 1000, config = function()
      vim.g.gruvbox_baby_background_color = "dark"
      vim.cmd[[colorscheme gruvbox-baby]]
  end },

  -- LSP
  { "neovim/nvim-lspconfig", config = function()
      require("lspconfig").lua_ls.setup{}
  end },

  -- Telescope
  { "nvim-telescope/telescope.nvim", tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
}
