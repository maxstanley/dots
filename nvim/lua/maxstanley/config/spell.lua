local Remap = require("maxstanley.keymap")
local nnoremap = Remap.nnoremap

vim.opt.spell = false
vim.opt.spelllang = "en_gb"

nnoremap("<Leader>z", ":set spell!<CR>")
