local autopairs = require("nvim-autopairs")

local nnoremap = require("maxstanley.keymap").nnoremap

autopairs.setup({})

vim.ui.select = require("popui.ui-overrider")
vim.ui.input = require("popui.input-overrider")

nnoremap("<Leader>u", ":UndotreeShow<CR>")

