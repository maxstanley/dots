local treesitter = require("nvim-treesitter.configs")

vim.cmd("colorscheme base16-tomorrow-night-eighties")

treesitter.setup({
	ensure_installed = "all",
	sync_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
})

