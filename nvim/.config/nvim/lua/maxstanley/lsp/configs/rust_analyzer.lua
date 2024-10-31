require'lspconfig'.rust_analyzer.setup{
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = false;
            },
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = "clippy",
            }
        }
    }
}