local M = {}

M.setup = function (use)
    -- sqls
    use 'nanotee/sqls.nvim'
    -- rust
    use "nvim-lua/plenary.nvim"
    use {
        "simrat39/rust-tools.nvim",
        config = function()
            require("conf.lsp.rust-tools")
        end
    }
    -- clangd
    use { "p00f/clangd_extensions.nvim",
        config = function()
            require("conf.lsp.clangd_extensions")
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
    use {
        "neovim/nvim-lspconfig",
        config = function()
            require("conf.lsp.nvim-lspconfig")
        end
    }
    -- 自动安装 LSP
    use { "williamboman/nvim-lsp-installer",
        config = function()
            require("conf.lsp.nvim-lsp-installer")
        end
    }
end

return M
