-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "rust_analyzer",
        "jdtls",
        "clangd",
        "gopls",
        "pyright",
        "volar",
        "tsserver",
        "jsonls",
        "cssls",
        "tailwindcss",
        "html",
        "lua_ls",
        -- "sqls"
    },
})

local lspconfig = require('lspconfig')
local M = {
    servers = {
        -- jdtls = require("conf.lsp.jdtls"),
        clangd = require("conf.lsp.clangd"),
        gopls = require("conf.lsp.go"),
        lua_ls = require("conf.lsp.sumneko_lua"),
        pyright = require("conf.lsp.pyright"),
        volar = require("conf.lsp.volar"),
        tsserver = require("conf.lsp.tsserver"),
        jsonls = require("conf.lsp.jsonls"),
        cssls = require("conf.lsp.cssls"),
        tailwindcss = require("conf.lsp.tailwindcss"),
        html = require("conf.lsp.html"),
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
    local opts = vim.tbl_deep_extend("force", M.opts, server_options)
    opts.on_attach = function(client, bufnr)
        M.opts.on_attach(client, bufnr)
        if server_options.on_attach then
            server_options.on_attach(client, bufnr)
        end
    end
    lspconfig[server_name].setup(opts)
end

return M
