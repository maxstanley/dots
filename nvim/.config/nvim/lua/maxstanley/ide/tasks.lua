local tasks = require("vstask")
local telescope = require("telescope")
local nnoremap = require("maxstanley.keymap").nnoremap

nnoremap("<Leader>t", function() telescope.extensions.vstask.tasks() end)

tasks.setup({
    cache_strategy = "last",
    autodetect = {
        npm = "on"
    }
})
