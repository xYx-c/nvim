-- https://github.com/mfussenegger/nvim-dap

-- WARN: dap 手动下载调试器
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
local dap = require("dap")
dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.env.HOME .. '/.local/share/nvim/dapinstall/codelldb/extension/adapter/codelldb',
        args = { "--port", "${port}" },
        -- On windows you may have to uncomment this:
        -- detached = false,
    },
}
-- 设置断点样式
vim.fn.sign_define("DapBreakpoint", { text = "⚫", texthl = "TodoFgFIX", linehl = "", numhl = "" })
-- 加载调试器配置
local dap_config = {
    -- java = require("conf.dap.java"),
    -- rust = require("conf,dap.lldb"),
    cpp = require("conf.dap.lldb"),
    c = require("conf.dap.lldb"),
    -- go = require("conf,dap.go"),
    -- python = require("conf.dap.python"),
}
-- 设置调试器
for dap_name, dap_options in pairs(dap_config) do
    -- dap.adapters[dap_name] = dap_options.adapters
    dap.configurations[dap_name] = dap_options.configurations
end

local dapui = require("dapui")
-- 初始化调试界面
dapui.setup(
    {
        layouts = {
            {
                elements = {
                    -- Elements can be strings or table with id and size keys.
                    -- { id = "scopes", size = 0.55 },
                    -- { id = "breakpoints", size = 0.15 },
                    -- { id = "stacks", size = 0.1 },
                    -- { id = "watches", size = 0.2 },
                    -- { id = "repl", size = 0.2 },
                },
                size = 55,
                position = "right",
            },
            {
                elements = {
                    -- "repl",
                    "console",
                    { id = "scopes", size = 0.3 },
                },
                size = 0.25,
                position = "bottom",
            },
        },
    }
)
local opts = {};
-- 如果开启或关闭调试，则自动打开或关闭调试界面
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open(opts)
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close(opts)
    -- dap.repl.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close(opts)
    -- dap.repl.close()
end

require"nvim-dap-virtual-text".setup {}

