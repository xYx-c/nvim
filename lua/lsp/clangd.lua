local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
return {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    filetype = { "c", "cc", "oc", "cpp", "objc", "objcpp", "cuda" },
    on_attach = require('keybinds').on_attach,
    capabilities = capabilities,
    cmd = {
        "clangd", "--offset-encoding=utf-16", "--background-index", "--clang-tidy",
        "--clang-tidy-checks=performance-*,bugprone-*", "--all-scopes-completion", "--pch-storage=disk",
    },
}
