-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])
-- https://github.com/wbthomason/packer.nvim/
local packer = require("packer")

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	--https://github.com/nvim-telescope/telescope.nvim
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

    -- https://github.com/ThePrimeagen/harpoon
    use({ "theprimeagen/harpoon" })

-----------------------------------Color Schemes-------------------------------
	-- setting  :colorscheme ron.
	-- https://github.com/rose-pine/neovim
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	})
	--  https://github.com/catppuccin/nvim
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		--		config = function()
		--			vim.cmd('colorscheme catppuccin')
		--		end
	})
    -- https://github.com/xiyaowong/transparent.nvim
    use({
        "xiyaowong/transparent.nvim"
    })

--------------------------------------- LSP ---------------------------------------

    -- the following is an example of translating from Plug to packer
	-- https://github.com/nvim-treesitter/nvim-treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- https://github.com/nvim-treesitter/playground
	use({ "nvim-treesitter/playground" })

	-- https://github.com/mbbill/undotree
	use({ "mbbill/undotree" })

    -- https://github.com/williamboman/mason.nvim 
    -- https://github.com/neovim/nvim-lspconfig
    -- https://github.com/williamboman/mason-lspconfig.nvim
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    -- https://github.com/VonHeikemen/lsp-zero.nvim
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }
    -- -- https://github.com/ryanoasis/vim-devicons

----------------------------------   git  -------------------------------------

    -- https://github.com/tpope/vim-fugitive
	use({ "tpope/vim-fugitive" })
	-- https://github.com/lewis6991/gitsigns.nvim
	use({ "lewis6991/gitsigns.nvim" })



	-- use ({ 'ryanoasis/vim-devicons' })

	-- -- https://github.com/Xuyuanp/nerdtree-git-plugin
	-- use ({ 'Xuyuanp/nerdtree-git-plugin' })

------------------------------ File System Navigation ------------------------------
	-- https://github.com/nvim-tree/nvim-tree.lua
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})

    -- -- https://github.com/preservim/nerdtree
    -- use ({ 'preservim/nerdtree' })

-- https://github.com/jose-elias-alvarez/null-ls.nvim (null-ls was archived 2023)
	-- use({ "jose-elias-alvarez/null-ls.nvim" })
end)
