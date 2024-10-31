require("maxstanley.lsp.mason")

-- Format on save.
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Set symbols to display on lines with LSP information
vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "E",
        [vim.diagnostic.severity.WARN] = "W",
        [vim.diagnostic.severity.HINT] = "H",
        [vim.diagnostic.severity.INFO] = "I",
      },
    },
    virtual_text = true,
})

local lsp_on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<leader>ki", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>kd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>kf", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<leader>ks", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>ka", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>kr", vim.lsp.buf.rename, opts)
end

local lsp = require("lsp-zero")

lsp.on_attach(lsp_on_attach)

require("maxstanley.lsp.cmake-tools")

require("maxstanley.lsp.configs.bashls")
require("maxstanley.lsp.configs.clangd")
require("maxstanley.lsp.configs.pylsp")
require("maxstanley.lsp.configs.rust_analyzer")
require("maxstanley.lsp.configs.yamlls")

lsp.setup()
