local tasks = require("vstask")
local telescope = require("telescope")

tasks.setup({
    cache_strategy = "last",
    autodetect = {
        npm = "on"
    }
})

vim.keymap.set("n", "<leader>t", function() telescope.extensions.vstask.tasks() end)