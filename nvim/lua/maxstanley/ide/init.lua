local autopairs = require("nvim-autopairs")

autopairs.setup({})

vim.ui.select = require("popui.ui-overrider")
vim.ui.input = require("popui.input-overrider")
