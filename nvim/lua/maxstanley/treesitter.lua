local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	ensure_installed = "all",
	sync_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},

	ignore_install = { "phpdoc" },

    tree_docs = {
        enabled = true
    },
})
