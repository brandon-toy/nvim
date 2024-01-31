vim.g.mapleader = " "

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>so", "<cmd>luafile $MYVIMRC<CR>")
vim.keymap.set("v", "<leader>y", '"+y')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
    -- Lua
    {
        {
            "kawre/leetcode.nvim",
            build = ":TSUpdate html",
            dependencies = {
                "nvim-telescope/telescope.nvim",
                "nvim-lua/plenary.nvim", -- required by telescope
                "MunifTanjim/nui.nvim",

                -- optional
                "nvim-treesitter/nvim-treesitter",
                "rcarriga/nvim-notify",
            },
            opts = {
                -- configuration goes here
             lang = "python3"
            },
        },
        {
            "folke/which-key.nvim",
            config = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
                require("which-key").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        },
        'Vimjas/vim-python-pep8-indent',
        'junegunn/fzf.vim',
        'mbbill/undotree',
        'jinh0/eyeliner.nvim',
        'nvimtools/none-ls.nvim',
        'glacambre/firenvim',
        'ryanoasis/vim-devicons',
        'mhartington/formatter.nvim',
        {
            "nvim-neotest/neotest-jest",
            "nvim-neotest/neotest-plenary",
            "nvim-neotest/neotest",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "antoinemadec/FixCursorHold.nvim",
                "nvim-treesitter/nvim-treesitter"
            }
        },
        'MunifTanjim/nui.nvim',
        {'Vim-code-browse', url='ssh://git.amazon.com:2222/pkg/Vim-code-browse'},
        "rebelot/kanagawa.nvim",
        'nvim-treesitter/playground',
        'ojroques/vim-oscyank',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'ThePrimeagen/harpoon',
        'ThePrimeagen/vim-be-good',
        'mbbill/undotree',
        'tpope/vim-fugitive',
        'nvim-lua/plenary.nvim',
        'mfussenegger/nvim-jdtls',
        'sbdchd/neoformat',
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.5',
            -- or                            , branch = '0.1.x',
            dependencies = { {'nvim-lua/plenary.nvim'} }
        },
        {
            'nvim-treesitter/nvim-treesitter',
            build = ':TSUpdate'
        },
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            dependencies = {
                {'williamboman/mason.nvim'},
                {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    }
})
