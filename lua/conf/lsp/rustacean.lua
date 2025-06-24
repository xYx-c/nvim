-- https://github.com/mrcjkb/rustaceanvim

vim.g.rustaceanvim = function()
    local extension_path = vim.fn.expand("$MASON/packages/codelldb/extension")
    local codelldb_path = extension_path .. '/adapter/codelldb'
    local liblldb_path = extension_path .. '/lldb/lib/liblldb'

    -- local this_os = vim.uv.os_uname().sysname;
    local system = io.popen("uname -s"):read("*l")
    if system == "Windows" then
        codelldb_path = extension_path .. "adapter\\codelldb.exe"
        liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
    else
        liblldb_path = liblldb_path .. (system == "Linux" and ".so" or ".dylib")
    end

    local cfg = require('rustaceanvim.config')
    return {
        -- tools = {},
        server = {
            on_attach = function(client, bufnr)
                require("keybinds").lsp_maps(client, bufnr)
                vim.lsp.inlay_hint.enable()
                vim.cmd [[command! -buffer RustDebuggables execute "lua vim.cmd.RustLsp { 'debuggables' }"]]
                vim.cmd [[command! -buffer RustRunnables execute "lua vim.cmd.RustLsp { 'runnables' }"]]
            end,
        },
        dap = {
            adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
        -- settings = {
        --     ["rust-analyzer"] = {
        --         inlayHints = {
        --             bindingModeHints = {
        --                 enable = false,
        --             },
        --             chainingHints = {
        --                 enable = true,
        --             },
        --             closingBraceHints = {
        --                 enable = true,
        --                 minLines = 25,
        --             },
        --             closureReturnTypeHints = {
        --                 enable = "never",
        --             },
        --             lifetimeElisionHints = {
        --                 enable = "never",
        --                 useParameterNames = false,
        --             },
        --             maxLength = 25,
        --             parameterHints = {
        --                 enable = true,
        --             },
        --             reborrowHints = {
        --                 enable = "never",
        --             },
        --             renderColons = true,
        --             typeHints = {
        --                 enable = true,
        --                 hideClosureInitialization = false,
        --                 hideNamedConstructor = false,
        --             },
        --         },
        --     }
        -- }
    }
end
