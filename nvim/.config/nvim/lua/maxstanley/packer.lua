vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Plugin Manager
    use("wbthomason/packer.nvim")

    -- Color Scheme
    use("RRethy/nvim-base16")

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    -- LSP
    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            { "saadparwaiz1/cmp_luasnip" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },

        }
    }

    -- Mason
    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate",
        requires = {
            { "williamboman/mason-lspconfig.nvim" },
            { "jay-babu/mason-null-ls.nvim" },

            -- DAP
            { "mfussenegger/nvim-dap" },

            -- Linters & Formatters
            { "jose-elias-alvarez/null-ls.nvim" },
        },
    }

    -- Spelling
    use { "f3fora/cmp-spell" }

    -- Prettier
    use { "MunifTanjim/prettier.nvim" }

    -- Telescope
    use { "nvim-lua/plenary.nvim" }
    use { "nvim-lua/popup.nvim" }
    use { "nvim-telescope/telescope.nvim" }
    use { "ThePrimeagen/git-worktree.nvim" }
    use { "nvim-telescope/telescope-live-grep-args.nvim" }

    -- Rust
    use { "rust-lang/rust.vim" }
    use { "simrat39/rust-tools.nvim" }

    -- C++
    use { "p00f/clangd_extensions.nvim" }
    use { "Civitasv/cmake-tools.nvim" }

    -- Markdown
    use { "godlygeek/tabular" }
    use { "plasticboy/vim-markdown" }

    -- IDE
    use { "lewis6991/gitsigns.nvim" }
    use { "TimUntersberger/neogit", requires = { "nvim-lua/plenary.nvim" } }
    use { "windwp/nvim-autopairs" }
    use { "hood/popui.nvim" }
    use { "RishabhRD/popfix" }
    use { "mbbill/undotree" }

    use { "EthanJWright/vs-tasks.nvim" }

    use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup({})
        end
    }
end)
