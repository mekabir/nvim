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
	-- the following is an example of translating from Plug to packer
	-- https://github.com/nvim-treesitter/nvim-treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- https://github.com/nvim-treesitter/playground
	use({ "nvim-treesitter/playground" })

	-- https://github.com/ThePrimeagen/harpoon
	use({ "theprimeagen/harpoon" })
	-- https://github.com/mbbill/undotree
	use({ "mbbill/undotree" })
	----------------------------------   git  -------------------------------------
	-- https://github.com/tpope/vim-fugitive
	use({ "tpope/vim-fugitive" })
	-- https://github.com/lewis6991/gitsigns.nvim
	use({ "lewis6991/gitsigns.nvim" })

	-- https://github.com/VonHeikemen/lsp-zero.nvim
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "sharkdp/fd" }, -- Required
		},
	})
	-- -- https://github.com/preservim/nerdtree
	-- use ({ 'preservim/nerdtree' })

	-- -- https://github.com/ryanoasis/vim-devicons
	-- use ({ 'ryanoasis/vim-devicons' })

	-- -- https://github.com/Xuyuanp/nerdtree-git-plugin
	-- use ({ 'Xuyuanp/nerdtree-git-plugin' })

	-- https://github.com/nvim-tree/nvim-tree.lua
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})

	-- https://github.com/jose-elias-alvarez/null-ls.nvim
	use({ "jose-elias-alvarez/null-ls.nvim" })
end)
