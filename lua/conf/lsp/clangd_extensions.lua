-- https://github.com/p00f/clangd_extensions.nvim

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
local clangd = vim.env.HOME .. '/.local/share/nvim/lsp_servers/clangd/clangd/bin/clangd'

local options = {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    filetype = { "c", "cc", "oc", "cpp", "objc", "objcpp", "cuda" },
    on_attach = function(client, bufnr)
        require('keybinds').lsp_maps(client, bufnr)
    end,
    capabilities = capabilities,
    cmd = {
        clangd, "--offset-encoding=utf-16", "--background-index", "--clang-tidy",
        "--clang-tidy-checks=performance-*,bugprone-*", "--all-scopes-completion", "--pch-storage=disk",
    },
}
require("clangd_extensions").setup({
    server = options,
})
