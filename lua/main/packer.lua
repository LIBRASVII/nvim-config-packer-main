-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Buffer Line
    use {'akinsho/bufferline.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function ()
        -- vim.opt.termguicolors = true
        require("bufferline").setup()
        end,
    }

    -- Autopair
    use{ 'altermo/ultimate-autopair.nvim',
    event={'InsertEnter','CmdlineEnter'},
    branch='v0.6', --recomended as each new version will have breaking changes
    config = function ()
        require('ultimate-autopair').setup({
                --Config goes here
                })
        end,
    }

    -- HTML/CSS view
    use { "turbio/bracey.vim",
      cmd = {"Bracey", "BracyStop", "BraceyReload", "BraceyEval"},
      build = "npm install --prefix server",
    }

    -- Color Pick
    use ({"ziontee113/color-picker.nvim",
        config = function()
            require("color-picker")
        end
    })

    -- Tailwindscss colorizer
    use({ "roobert/tailwindcss-colorizer-cmp.nvim",
      -- optionally, override the default options:
      config = function()
        require("tailwindcss-colorizer-cmp").setup({
          color_square_width = 2,
        })
      end
    })

    -- Prettier
    use 'MunifTanjim/prettier.nvim'

    -- Top bar (buffer)
    use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
    use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
    use 'romgrk/barbar.nvim'

    -- Define your keymaps, commands, and autocommands as simple Lua tablesi,...
    use  { 'mrjones2014/legendary.nvim',
      version = 'v2.1.0',
      -- since legendary.nvim handles all your keymaps/commands,
      -- its recommended to load legendary.nvim before other plugins
      priority = 10000,
      lazy = false,
      -- sqlite is only needed if you want to use frecency sorting
      -- dependencies = { 'kkharji/sqlite.lua' }
    }

    -- Config windows
    use 'mrjones2014/smart-splits.nvim'

    -- RGB color
    use { 'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer')
        end
    }

    -- Better Comment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Nulls
    use 'nvimtools/none-ls.nvim'

    -- WakaTime
    use 'wakatime/vim-wakatime'

    -- Mason
    use {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "clang-format",
                "css-lsp",
            }
        },
        "mfussenegger/nvim-dap",
        "jay-babu/mason-nvim-dap.nvim",
    }

    -- whick-key
    use {
        "folke/which-key.nvim",
        opts = {
            defaults = {
                ["<leader>d"] = { name = "+debug" },
            }
        },
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- DAP
    --  use 'mfussenegger/nvim-dap'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- colorscheme
    use { 'shaunsingh/nord.nvim' }

    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end, }

    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("theprimeagen/refactoring.nvim")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("nvim-treesitter/nvim-treesitter-context");

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use("folke/zen-mode.nvim")
    use("github/copilot.vim")
    use("eandrju/cellular-automaton.nvim")
    use("laytan/cloak.nvim")

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }
end)
