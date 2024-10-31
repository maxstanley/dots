local autopairs = require("nvim-autopairs")

autopairs.setup({})

vim.ui.select = require("popui.ui-overrider")
vim.ui.input = require("popui.input-overrider")

vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>")