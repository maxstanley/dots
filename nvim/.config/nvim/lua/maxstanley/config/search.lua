local Remap = require("maxstanley.keymap")
local nnoremap = Remap.nnoremap

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "nosplit"

nnoremap("<Leader>h", ":nohlsearch<CR>")
