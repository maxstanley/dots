local Remap = require("maxstanley.keymap")
local nnoremap = Remap.nnoremap

local tab_width = 4

vim.opt.tabstop = tab_width
vim.opt.softtabstop = tab_width
vim.opt.shiftwidth = tab_width

vim.opt.smartindent = true
vim.opt.autoindent = true

-- Show white space characters
vim.opt.listchars = {
	eol = "$",
	space = ".",
	tab = "> ",
	trail = "~",
	extends = ">",
	precedes = "<"
}
nnoremap("<Leader>w", ":set list!<CR>")

-- https://github.com/dinhmai74/dotfile-lua/blob/95542e6cc418dd1d995a4d2b4cfb1a82dd1e6733/nvim/lua/init.lua#L37-L46
-- Auto comment on '\n', do not comment on insert
vim.cmd [[ autocmd BufWinEnter * lua vim.opt.formatoptions = "crqnlj" ]]
