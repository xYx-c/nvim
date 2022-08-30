-- https://github.com/p00f/clangd_extensions.nvim

local clangd = vim.env.HOME .. '/.local/share/nvim/mason/bin/clangd'

local opts = {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    filetype = { "c", "cc", "oc", "cpp", "objc", "objcpp" },
    on_attach = function(client, bufnr)
        require('keybinds').lsp_maps(client, bufnr)
    end,
    cmd = {
        clangd, "--offset-encoding=utf-16", "--background-index", "--clang-tidy",
        "--clang-tidy-checks=performance-*,bugprone-*", "--all-scopes-completion", "--pch-storage=disk",
    },
    capabilities = require"cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

return opts
