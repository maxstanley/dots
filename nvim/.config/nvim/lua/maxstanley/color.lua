local base16 = require("base16-colorscheme")

base16.with_config({
    telescope = true,
    cmp = true,
})

vim.cmd("colorscheme base16-tomorrow-night-eighties")
