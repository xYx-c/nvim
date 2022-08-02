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
