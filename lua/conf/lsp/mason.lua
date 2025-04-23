-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup({
    ensure_installed = {
        "rust_analyzer",
        "jdtls",
        "clangd",
        "gopls",
        "pylyzer",
        "volar",
        "ts_ls",
        "jsonls",
        "cssls",
        "tailwindcss",
        "html",
        "lua_ls",
        -- "sqls"
    },
})

local mason_registry = require('mason-registry')
local function install_or_skip(package_name)
    if (mason_registry.is_installed(package_name)) then return end
    mason_registry.refresh()
    vim.cmd { cmd = "MasonInstall", args = { package_name } }
end
install_or_skip("java-debug-adapter")
install_or_skip("java-test")
install_or_skip("codelldb")
install_or_skip("prettierd")

local lspconfig = require('lspconfig')
local M = {
    servers = {
        clangd = require("conf.lsp.clangd"),
        gopls = require("conf.lsp.go"),
        lua_ls = require("conf.lsp.sumneko_lua"),
        ts_ls = require("conf.lsp.tsserver"),
        cssls = require("conf.lsp.cssls"),
        tailwindcss = require("conf.lsp.tailwindcss"),
        html = require("conf.lsp.html"),
        volar = require("conf.lsp.volar"),
        jsonls = require("conf.lsp.jsonls"),
        pylyzer = require("conf.lsp.pylyzer"),
        -- jdtls = require("conf.lsp.jdtls"),
        -- sqls = require("conf.lsp.sqls"),
    },
    opts = {
        root_dir = function()
            return vim.fn.getcwd()
        end,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        on_attach = function(client, bufnr)
            require('keybinds').lsp_maps(client, bufnr)
        end
    }
}

for server_name, server_options in pairs(M.servers) do
    local opts = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), M.opts, server_options)
    opts.on_attach = function(client, bufnr)
        M.opts.on_attach(client, bufnr)
        if server_options.on_attach then
            server_options.on_attach(client, bufnr)
        end
    end
    lspconfig[server_name].setup(opts)
end

return M
