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
    automatic_enable = false,
    ensure_installed = {
        "rust_analyzer",
        "jdtls",
        "clangd",
        "gopls",
        "ty",
        "vue_ls",
        "vtsls",
        "jsonls",
        "cssls",
        "tailwindcss",
        "html",
        "lua_ls",
        "lemminx",
        -- "sqls"
    },
})

local mason_registry = require('mason-registry')
local function install_or_skip(package_names)
    for _, package_name in ipairs(package_names) do
        if (mason_registry.is_installed(package_name)) then return end
        mason_registry.refresh()
        vim.cmd { cmd = "MasonInstall", args = { package_name } }
    end
end
install_or_skip({ "java-debug-adapter", "java-test", "codelldb", "prettierd" })

local M = {
    servers = {
        clangd = require("conf.lsp.clangd"),
        gopls = require("conf.lsp.go"),
        jdtls = require("conf.lsp.jdtls"),
        lua_ls = require("conf.lsp.sumneko_lua"),
        cssls = require("conf.lsp.cssls"),
        tailwindcss = require("conf.lsp.tailwindcss"),
        html = require("conf.lsp.html"),
        vue_ls = require("conf.lsp.volar"),
        vtsls = require("conf.lsp.vtsls"),
        jsonls = require("conf.lsp.jsonls"),
        ty = require("conf.lsp.ty"),
        lemminx = nil,
        -- sqls = require("conf.lsp.sqls"),
    },
    opts = {
        -- root_dir = function()
        --     return vim.fn.getcwd()
        -- end,
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
    vim.lsp.config(server_name, opts)
    vim.lsp.enable(server_name)
end

return M
