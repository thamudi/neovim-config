-- },
return {
    -- Example plugins
    { "nvim-lua/popup.nvim" },   -- An implementation of the Popup API from vim in Neovim
    { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins

    -- Colorscheme
    -- { "luisiacc/gruvbox-baby", lazy = false, priority = 1000, config = function()
    --     vim.g.gruvbox_baby_background_color = "dark"
    --     vim.cmd[[colorscheme gruvbox-baby]]
    -- end },

    -- {
    -- "Mofiqul/vscode.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    -- require("vscode").setup {
    -- transparent = true,
    -- }
    -- vim.cmd [[colorscheme vscode]]
    -- end
    -- },
    -- null-ls
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup {
                sources = {
                    null_ls.builtins.formatting.prettier.with({ filetypes = { "yaml" } }),
                }
            }
        end

    },
    -- LSP
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            -- Lua LSP setup
            lspconfig.lua_ls.setup {}

            -- YAML LSP setup
            lspconfig.yamlls.setup {
                settings = {
                    yaml = {
                        schemas = {
                            ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.25.0-standalone-strict/all.json"] = "k8s-*.yaml",
                            ["https://json.schemastore.org/kustomization"] = "kustomization.yaml",
                            ["https://json.schemastore.org/helmfile"] = "helmfile.yaml",
                        },
                    },
                },
            }
        end
    },
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = false,
        config = function()
            require("treesitter-context").setup {
                ensure_installed = { "lua", "yaml", "json", "vimdoc", "vim", "markdown", "markdown_inline" },
                highlight = {
                    enable = true,
                    disable = { "markdown" },
                },
                indent = {
                    enable = true,
                    disable = { "yaml" },
                }
            }
        end
    },
    -- Sticky scroll / context viewer
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            -- Configuration options for nvim-treesitter-context
            -- enable = true, -- Enable this plugin (the default)
            max_lines = 0, -- How many lines of context to show (0=auto)
            -- min_window_height = 0, -- Minimum window height to enable plugin
            -- line_numbers = true,
            -- multiline_threshold = 20, -- Maximum number of lines to show for a single context
            -- trim_scope = 'outer', -- Which context lines to discard first when trimming
            -- mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
            -- separator = nil, -- Separator between context and content
            -- zindex = 20, -- The Z-index of the context window
            -- on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
        },
        -- Optional: Add keymap to toggle the context display
        -- keys = {
        --   { "<leader>sc", function() require("treesitter-context").toggle() end, desc = "Toggle Sticky Context" },
        -- },
    },
    -- Git
    {
        "lewis6991/gitsigns.nvim",
        -- filepath: ~/.config/nvim/init.lua
        -- ... (previous settings) ...
        config = function()
            require("gitsigns").setup {}
        end
    },
    -- Autopairs
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    },
    -- Comment
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup {}
        end
    },
    -- File Explorer
    {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup {
                view = {
                    width = 30,
                    side = "right",
                },
                filters = {
                    dotfiles = false,
                },
                git = {
                    enable = true,
                },
            }
        end
    },
    -- Status Line
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup {}
        end
    },
    -- Buffer Line
    {
        "akinsho/bufferline.nvim",
        config = function()
            require("bufferline").setup {}
        end
    },
    -- Which Key
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end
    },
    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup {
                direction = "horizontal",
                size = 10,
                insert_mappings = true,
                open_mapping = [[<C-t>]],
                hide_numbers = true,
            }
        end
    },
    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        config = function()
            require("harpoon").setup {}
        end
    },
    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        }
    }

}
