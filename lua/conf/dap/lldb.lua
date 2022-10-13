-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode

local extension_path = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local system = io.popen("uname -s"):read("*l")
local liblldb_path = ""
if system == "Darwin" then
    liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
elseif system == "Linux" then
    liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
elseif system == "Linux" then
    liblldb_path = extension_path .. 'lldb/lib/liblldb.dll'
end
return {
    adapters = {
        codelldb = {
            type = 'server',
            port = "${port}",
            executable = {
                -- command = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb',
                command = codelldb_path,
                args = { "--liblldb", liblldb_path, "--port", "${port}" },
                -- On windows you may have to uncomment this:
                -- detached = false,
            },
        },
    },
    configurations = {
        {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = true,
        },
    }
}
