local nnoremap = require("maxstanley.keymap").nnoremap

vim.opt.spell = true
vim.opt.spelllang = "en_gb"

nnoremap("<Leader>z", ":set spell!<CR>")
