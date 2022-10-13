local M = {}

M.setup = function(use)
    -- sqls
    use { 'nanotee/sqls.nvim' }
    -- rust
    use {
        "simrat39/rust-tools.nvim",
        config = function()
            require("conf.lsp.rust-tools")
        end
    }
    -- clangd
    use { "p00f/clangd_extensions.nvim",
        config = function()
            require("conf.lsp.clangd")
        end
    }
    -- java
    use {
        "mfussenegger/nvim-jdtls",
    }
    -- go
    use {
        "ray-x/go.nvim",
        config = function()
            require("conf.lsp.go")
        end
    }
    -- LSP 基础服务
    use { "neovim/nvim-lspconfig" }
    use { "nvim-lua/plenary.nvim" }
    -- 安装 LSP/DAP
    use {
        "williamboman/mason.nvim",
        config = function()
            require("conf.lsp.mason")
        end,
        requires = {
            "williamboman/mason-lspconfig.nvim",
        }
    }
    use {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("conf.lsp.null-ls")
        end,
    }
end

return M
