-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,
	})

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("romgrk/barbar.nvim")
	use("nvim-treesitter/playground")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("leafOfTree/vim-svelte-plugin")
	use("christoomey/vim-tmux-navigator")
	use("numToStr/Comment.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	use("nvim-tree/nvim-tree.lua")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("lewis6991/gitsigns.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("github/copilot.vim")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.api.nvim_command, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})
	if packer_bootstrap then
		require("packer").sync()
	end
end)
