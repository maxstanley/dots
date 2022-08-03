local telescope = require("telescope")
local sorters = require("telescope.sorters")
local previewers = require("telescope.previewers")

local Remap = require("maxstanley.keymap")
local nnoremap = Remap.nnoremap

telescope.setup({
	defaults = {
		file_sorter = sorters.get_fzy_sorter,
		prompt_prefix = "> ",
		color_devicons = true,

		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,

		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
      		"--with-filename",
      		"--line-number",
      		"--column",
      		"--smart-case",
      		"--trim"
		}
	}
})

telescope.load_extension("git_worktree")
telescope.load_extension("live_grep_args")

nnoremap("<Leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<Leader>fa", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
