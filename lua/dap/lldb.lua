-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode
return {
    adapters = {
        codelldb = {
            type = 'server',
            port = "${port}",
            executable = {
                command = vim.env.HOME .. '/.local/share/nvim/dapinstall/codelldb/extension/adapter/codelldb',
                args = {"--port", "${port}"},
                -- On windows you may have to uncomment this:
                -- detached = false,
            }, -- adjust as needed, must be absolute path
        },
    },
    configurations = {
        {
            name = 'Launch file',
            type = 'codelldb',
            request = 'launch',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = true,
            -- 💀
            -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
            --
            --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
            --
            -- Otherwise you might get the following error:
            --
            --    Error on launch: Failed to attach to the target process
            --
            -- But you should be aware of the implications:
            -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
            -- runInTerminal = false,
        }
    },
}
