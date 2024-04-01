local gitsigns = require("gitsigns")
local neogit = require("neogit")

local nnoremap = require("maxstanley.keymap").nnoremap

gitsigns.setup({})
neogit.setup({})

nnoremap("<Leader>g", function() neogit.open() end)

