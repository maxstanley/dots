require("mason").setup({})

require("mason-lspconfig").setup({
    automatic_installation = true,
    -- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
    ensure_installed = {
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
        "pylsp",
        "pyright",
        "rnix",
        "rust_analyzer",
        "terraformls",
        "ts_ls",
        "yamlls"
    }
})

require("mason-null-ls").setup({
    automatic_installation = true,
    ensure_installed = {
        "clang-format",
        "cmakelang",
        "cspell",
        "fixjson",
        "goimports",
        "luaformatter",
        "markdownlint",
        "prettier",
        "reorder-python-imports",
        "ruff",
        "rustfmt",
        "shellcheck",
        "shellharden",
        "shfmt",
        "yamlfmt"
    }
})