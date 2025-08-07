-- https://github.com/p00f/clangd_extensions.nvim
-- https://github.com/Civitasv/cmake-tools.nvim

local clangd = vim.env.HOME .. '/.local/share/nvim/mason/bin/clangd'

local opts = {
    filetype = { "c", "cc", "oc", "cpp", "objc", "objcpp" },
    on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable()
        require('keybinds').lsp_maps(client, bufnr)
        vim.keymap.set("n", "\\", "<cmd>CMakeQuickDebug<cr>", { buffer = bufnr })
    end,
    cmd = {
        clangd,
        "--background-index",
        "--compile-commands-dir=build",
        "--clang-tidy",
        "--clang-tidy-checks=performance-*,bugprone-*",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--pch-storage=disk",
        "--header-insertion=never",
        "--fallback-style={BasedOnStyle: llvm, ColumnLimit: 120}",
    },
}

-- local osys = require("cmake-tools.osys")
require("cmake-tools").setup {
    -- auto generate when save CMakeLists.txt
    cmake_regenerate_on_save = false,
    -- this will be passed when invoke `CMakeGenerate`
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
    cmake_build_options = {},
    -- support macro expansion:
    --       ${kit}
    --       ${kitGenerator}
    --       ${variant:xx}
    -- this is used to specify generate directory for cmake, allows macro expansion, can be a string or a function returning the string, relative to cwd.
    -- cmake_build_directory = function()
    --     if osys.iswin32 then
    --         return "build\\${variant:buildType}"
    --     end
    --     return "build/${variant:buildType}"
    -- end,
    cmake_build_directory = "build",
    cmake_compile_commands_options = {
        -- available options: soft_link, copy, lsp, none
        action = "lsp",
    },
    cmake_virtual_text_support = false, -- Show the target related to current file using virtual text (at right corner)
}
return opts
