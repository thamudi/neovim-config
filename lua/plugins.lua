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
   -- Markdown Preview
  { "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-treesitter/nvim-treesitter-context", lazy = false, config = function()
      require("treesitter-context").setup{}
  end },
  -- Git
  { "lewis6991/gitsigns.nvim", config = function()
      require("gitsigns").setup{}
  end },
  -- Autopairs
  { "windwp/nvim-autopairs", config = function()
      require("nvim-autopairs").setup{}
  end },
  -- Comment
  { "numToStr/Comment.nvim", config = function()
      require("Comment").setup{}
  end },
  -- File Explorer
  { "kyazdani42/nvim-tree.lua", config = function()
      require("nvim-tree").setup{}
  end },
  -- Status Line
  { "nvim-lualine/lualine.nvim", config = function()
      require("lualine").setup{}
  end },
  -- Buffer Line
  { "akinsho/bufferline.nvim", config = function()
      require("bufferline").setup{}
  end },
  -- Which Key
  { "folke/which-key.nvim", config = function()
      require("which-key").setup{}
  end },
  -- Terminal
  { "akinsho/toggleterm.nvim", config = function()
      require("toggleterm").setup{}
  end },
  -- Harpoon
  { "ThePrimeagen/harpoon", config = function()
      require("harpoon").setup{}
  end },
  -- GitHub Copilot
  { "github/copilot.vim", config = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
  end },
}
