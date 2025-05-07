-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode


local mason_registry = require('mason-registry')
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

local function get_binary_executables(directory)
    if vim.fn.isdirectory(directory) == 0 then return {} end
    local binary_files = {}
    local handle = io.popen('ls -p ' .. directory)
    if handle == nil then return binary_files end
    local files = handle:read("*a")
    handle:close()
    for file in string.gmatch(files, "[^\n]+") do
        local full_path = directory .. '/' .. file
        if vim.fn.isdirectory(full_path) == 0 and vim.fn.executable(full_path) == 1 then
            table.insert(binary_files, file)
        end
    end
    return binary_files
end

local current_directory = vim.api.nvim_call_function('expand', { '%:p:h' })
local rust_programs = get_binary_executables(current_directory .. "/target/debug")

local configurations = {}
for _, program in ipairs(rust_programs) do
    table.insert(configurations, {
        name = program,
        type = "codelldb",
        request = "launch",
        cargo = {
            args = { "test", "--no-run", "--lib" },
        },
        program = "${workspaceFolder}/target/debug/" .. program,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    })
end

local cfg = require('rustaceanvim.config')
return {
    adapter = {
        type = 'server',
        port = "${port}",
        executable = {
            command = codelldb_path,
            args = { "--liblldb", liblldb_path, "--port", "${port}" },
            -- On windows you may have to uncomment this:
            -- detached = false,
        },
    },
    configurations = configurations

}
