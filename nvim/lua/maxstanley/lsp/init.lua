local lsp = require("lsp-zero")
local cmp = require("maxstanley.lsp.cmp")

-- Format on save.
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
local lsp_servers = {
    "bashls",
    "clangd",
    "dockerls",
    "docker_compose_language_service",
    "eslint",
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "marksman",
    "neocmake",
    "pyright",
    "rnix",
    "rust_analyzer",
    "terraformls",
    "tsserver",
    "yamlls"
}

require("mason").setup({})

require("mason-lspconfig").setup({
    automatic_installation = true,
    ensure_installed = lsp_servers
})

require("mason-null-ls").setup({
    automatic_installation = true,
    ensure_installed = {
        "clang-format",
        "cmakelang",
        "fixjson",
        "goimports",
        "luaformatter",
        "markdownlint",
        "prettier",
        "ruff",
        "rustfmt",
        "shellcheck",
        "shellharden",
        "yamlfmt"
    }
})

local nvim_cmp_config = cmp.NvimCmpConfiguration(lsp.defaults.cmp_mappings())

local lsp_on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    local bind = vim.keymap.set

    bind("n", "<Leader>ki", vim.lsp.buf.hover, opts)

    bind("n", "<Leader>kd", vim.lsp.buf.definition, opts)
    bind("n", "<Leader>kf", vim.lsp.buf.declaration, opts)
    bind("n", "<Leader>ks", vim.lsp.buf.references, opts)

    bind("n", "<Leader>ka", vim.lsp.buf.code_action, opts)
    bind("n", "<Leader>kr", vim.lsp.buf.rename, opts)
end

local yamlls_config = {
    settings = {
        yaml = {
            keyOrdering = false,
            schemas = {
                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "/.gitlab-ci.yml",
            }
        }
    }
}

local rust_analyzer_config = {
    server = {
        cargo = {
            allFeatures = true,
        },
        checkOnSave = {
            command = "clippy",
        }
    }
}

lsp.preset("recommended")

lsp.setup_nvim_cmp(nvim_cmp_config)

lsp.set_preferences({
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I",
    }
})

lsp.on_attach(lsp_on_attach)

lsp.configure("rust_analyzer", rust_analyzer_config)
lsp.configure("yamlls", yamlls_config)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
