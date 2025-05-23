-- https://github.com/p00f/clangd_extensions.nvim
-- https://github.com/Civitasv/cmake-tools.nvim

local clangd = vim.env.HOME .. '/.local/share/nvim/mason/bin/clangd'

local opts = {
    -- root_dir = function()
    --     return vim.fn.getcwd()
    -- end,
    filetype = { "c", "cc", "oc", "cpp", "objc", "objcpp" },
    on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable()
        require('keybinds').lsp_maps(client, bufnr)
        -- client.server_capabilities.documentFormattingProvider = false
        -- client.server_capabilities.documentRangeFormattingProvider = false
    end,
    cmd = {
        clangd,
        "--offset-encoding=utf-16",
        "--background-index",
        "--clang-tidy",
        "--clang-tidy-checks=performance-*,bugprone-*",
        "--all-scopes-completion",
        "--pch-storage=disk",
        "--header-insertion=never",
    },
    settings = {
        clangd = {
            InlayHints = {
                Designators = true,
                Enabled = true,
                ParameterNames = true,
                DeducedTypes = true,
            },
            fallbackFlags = { "-std=c++23" },
        },
    }
}

return opts
