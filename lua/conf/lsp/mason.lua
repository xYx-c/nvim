-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim

local lspconfig = require('lspconfig')
require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "rust_analyzer", "jdtls", "clangd", "gopls",
        "pyright", "volar", "tsserver", "jsonls", "cssls",
        "html", "sqls", "sumneko_lua"
    },
})

local M = {}

M.servers = {
    rust_analyzer = require("conf.lsp.rust-tools"),
    -- jdtls = require("conf.lsp.jdtls"),
    clangd = require("conf.lsp.clangd"),
    gopls = require("conf.lsp.go"),
    sumneko_lua = require("conf.lsp.sumneko_lua"),
    pyright = require("conf.lsp.pyright"),
    volar = require("conf.lsp.volar"),
    tsserver = require("conf.lsp.tsserver"),
    jsonls = require("conf.lsp.jsonls"),
    cssls = require("conf.lsp.cssls"),
    html = require("conf.lsp.html"),
    sqls = require("conf.lsp.sqls"),
}

M.opts = {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = function(client, bufnr)
        require('keybinds').lsp_maps(client, bufnr)
    end
}

for server_name, server_options in pairs(M.servers) do
    local opts = vim.tbl_deep_extend("force", M.opts, server_options)
    if server_name == "clangd" then
        require("clangd_extensions").setup {
            server = opts,
        }
    elseif server_name == "rust_analyzer" then
        require('rust-tools').setup({
            server = opts,
            dap = opts.dap,
        })
    -- elseif server_name == "jdtls" then
    --     require('jdtls').start_or_attach(opts)
    else
        lspconfig[server_name].setup(opts)
    end
end

return M
