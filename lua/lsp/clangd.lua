return {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    filetype = { "c", "cc", "oc", "cpp", "objc", "objcpp", "cuda" },
    cmd = {
        "clangd", "--offset-encoding=utf-16", "--background-index", "--clang-tidy",
        "--clang-tidy-checks=performance-*,bugprone-*", "--all-scopes-completion", "--pch-storage=disk",
    },
}
