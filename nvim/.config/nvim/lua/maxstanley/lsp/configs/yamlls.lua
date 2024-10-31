require'lspconfig'.yamlls.setup {
    settings = {
        yaml = {
            keyOrdering = false,
            schemas = {
                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "/.gitlab-ci.yml",
            }
        }
    }
}