return {
    ["williamboman/mason.nvim"] = {
        override_options = {
            ensure_installed = {
                -- lua stuff
                "lua-language-server",
                "stylua",

                -- web dev
                "css-lsp",
                "html-lsp",
                "typescript-language-server",
                "emmet-ls",
                "json-lsp",

                -- shell
                "shfmt",
                "shellcheck",
            },
        },
    },

    ["neovim/nvim-lspconfig"] = {
        after = { "mason.nvim" },
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.plugins.lspconfig"
        end,
    },

    ["jose-elias-alvarez/null-ls.nvim"] = {
        after = "nvim-lspconfig",
        config = function()
            require "custom.plugins.null-ls"
        end,
    },
    -- load it after nvim-lspconfig cuz we lazy loaded lspconfig
}
