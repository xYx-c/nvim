-- https://github.com/p00f/clangd_extensions.nvim
-- https://github.com/Civitasv/cmake-tools.nvim

local clangd = vim.env.HOME .. '/.local/share/nvim/mason/bin/clangd'

local opts = {
    filetype = { "c", "cc", "oc", "cpp", "objc", "objcpp" },
    on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable()
        require('keybinds').lsp_maps(client, bufnr)
        -- vim.keymap.set("n", "\\", "<cmd>CMakeQuickDebug<cr>", { buffer = bufnr })
        -- client.server_capabilities.documentFormattingProvider = false
        -- client.server_capabilities.documentRangeFormattingProvider = false
    end,
    cmd = {
        clangd,
        -- "--offset-encoding=utf-16",
        "--background-index",
        "--compile-commands-dir=build",
        "--clang-tidy",
        "--clang-tidy-checks=performance-*,bugprone-*",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--pch-storage=disk",
        "--header-insertion=never",
        -- "--fallback-style={ColumnLimit: 120}",
    },
    settings = {
        clangd = {
            InlayHints = {
                Designators = true,
                Enabled = true,
                ParameterNames = true,
                DeducedTypes = true,
            },
            fallbackFlags = { "-std:c++latest" },
        },
    }
}

local osys = require("cmake-tools.osys")
require("cmake-tools").setup {
    cmake_command = "cmake",                                        -- this is used to specify cmake command path
    ctest_command = "ctest",                                        -- this is used to specify ctest command path
    cmake_use_preset = true,
    cmake_regenerate_on_save = true,                                -- auto generate when save CMakeLists.txt
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
    cmake_build_options = {},                                       -- this will be passed when invoke `CMakeBuild`
    -- support macro expansion:
    --       ${kit}
    --       ${kitGenerator}
    --       ${variant:xx}
    cmake_build_directory = function()
        if osys.iswin32 then
            return "out\\${variant:buildType}"
        end
        return "out/${variant:buildType}"
    end,            -- this is used to specify generate directory for cmake, allows macro expansion, can be a string or a function returning the string, relative to cwd.
    cmake_compile_commands_options = {
        action = "lsp", -- available options: soft_link, copy, lsp, none
        -- soft_link: this will automatically make a soft link from compile commands file to target
        -- copy:      this will automatically copy compile commands file to target
        -- lsp:       this will automatically set compile commands file location using lsp
        -- none:      this will make this option ignored
        target = vim.loop.cwd()              -- path to directory, this is used only if action == "soft_link" or action == "copy"
    },
    cmake_dap_configuration = {              -- debug settings for cmake
        name = "cpp",
        type = "codelldb",
        request = "launch",
        stopOnEntry = false,
        runInTerminal = true,
        console = "integratedTerminal",
    },
    cmake_virtual_text_support = false, -- Show the target related to current file using virtual text (at right corner)
}
return opts
