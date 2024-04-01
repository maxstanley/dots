local cmp = require("cmp")

local scroll_distance = 4
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    mapping = {
        -- Select intellisense item
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),

        -- Scrolling language documents
        ["<Up>"] = cmp.mapping.scroll_docs(-scroll_distance),
        ["<Down>"] = cmp.mapping.scroll_docs(scroll_distance),

        -- Abort docs
        ["<Esc>"] = cmp.mapping.abort(),
    },
    sources = {
        {
            name = "path",
            priority = 1,
            group_index = 1,
        },
        {
            name = "nvim_lsp",
            priority = 1,
            group_index = 2,
        },
        {
            name = "luasnip",
            priority = 3,
            group_index = 2,
            keyword_length = 4,
            max_item_count = 2,
        },
        {
            name = "spell",
            priority = 4,
            group_index = 4,
            keyword_length = 4,
            max_item_count = 5,
        },
    }
})
