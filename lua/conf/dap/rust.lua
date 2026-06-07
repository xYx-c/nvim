-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode

-- local extension_path = vim.fn.expand("$MASON/packages/codelldb/extension")
local extension_path = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension'
local codelldb_path = extension_path .. '/adapter/codelldb'
local liblldb_path = extension_path .. '/lldb/lib/liblldb'


local this_os = vim.uv.os_uname().sysname;
-- local system = io.popen("uname -s"):read("*l")
if this_os:find("Windows") then
    codelldb_path = extension_path .. "adapter\\codelldb.exe"
    liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
else
    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
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

local current_file = vim.api.nvim_buf_get_name(0)
local project_root = vim.fs.root(current_file, { "Cargo.toml" }) or vim.fn.getcwd()
local rust_programs = get_binary_executables(project_root .. "/target/debug")

local function cargo_build(program_path)
    return coroutine.create(function(coro)
        vim.notify("Running cargo build...", vim.log.levels.INFO, { title = "Rust DAP" })

        local stdout = {}
        local stderr = {}
        vim.system({ "cargo", "build" }, {
            cwd = project_root,
            text = true,
            stdout = function(_, data)
                if data and data ~= "" then
                    table.insert(stdout, data)
                end
            end,
            stderr = function(_, data)
                if data and data ~= "" then
                    table.insert(stderr, data)
                end
            end,
        }, function(result)
            vim.schedule(function()
                local output = table.concat(stdout)
                local errors = table.concat(stderr)
                local log = vim.trim(output .. errors)

                if result.code ~= 0 then
                    vim.notify(log ~= "" and log or "cargo build failed", vim.log.levels.ERROR, { title = "Rust DAP" })
                    coroutine.resume(coro, nil)
                    return
                end

                if log ~= "" then
                    vim.notify(log, vim.log.levels.INFO, { title = "Rust DAP" })
                end
                vim.notify("cargo build finished", vim.log.levels.INFO, { title = "Rust DAP" })
                coroutine.resume(coro, program_path)
            end)
        end)
    end)
end

local configurations = {}
for _, program in ipairs(rust_programs) do
    local program_path = project_root .. "/target/debug/" .. program
    table.insert(configurations, {
        name = program,
        type = "codelldb",
        request = "launch",
        cargo = {
            args = { "test", "--no-run", "--lib" },
        },
        program = function()
            return cargo_build(program_path)
        end,
        cwd = project_root,
        stopOnEntry = false,
        sourceLanguages = { "rust" },
    })
end

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
