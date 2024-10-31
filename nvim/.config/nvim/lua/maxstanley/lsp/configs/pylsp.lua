require'lspconfig'.pylsp.setup{
    settings = {
        pylsp = {
            autopep8 = { enabled = true },
            flake8 = { enabled = true },
            jedi_completion = { enabled = true },
            jedi_definition = { enabled = true },
            jedi_hover = { enabled = true },
            jedi_references = { enabled = true },
            jedi_signature_help = { enabled = true },
            jedi_symbols = { enabled = true, all_scopes = true }, 
            rope_autoimport = { enabled = true },
        }
    }
}