vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
	-- Plugin Manager
    use("wbthomason/packer.nvim")

	-- Color Scheme
    use("RRethy/nvim-base16")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")

	-- Telescope
	use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")
	use("ThePrimeagen/git-worktree.nvim")
	use("nvim-telescope/telescope-live-grep-args.nvim")

	-- Rust
	use("rust-lang/rust.vim")
	use("simrat39/rust-tools.nvim")

	-- IDE
	use("lewis6991/gitsigns.nvim")
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
	use("windwp/nvim-autopairs")
end)
