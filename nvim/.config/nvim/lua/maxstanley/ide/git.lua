local gitsigns = require("gitsigns")
local neogit = require("neogit")

gitsigns.setup({})
neogit.setup({})

vim.keymap.set("n", "<leader>g", function() neogit.open() end)