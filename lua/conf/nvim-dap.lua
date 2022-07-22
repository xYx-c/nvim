-- https://github.com/mfussenegger/nvim-dap

-- WARN: dap 手动下载调试器
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
local dap = require("dap")
-- 设置断点样式
vim.fn.sign_define("DapBreakpoint", {text = "●", texthl = "TodoFgFIX", linehl = "", numhl = ""})
-- 加载调试器配置
local dap_config = {
<<<<<<< HEAD
=======
    rust = require("dap.rust"),
    cpp = require("dap.rust"),
>>>>>>> 7d6c33b5fe6e15e9d088b9b91bae393a473d21a4
    java = require("dap.java"),
    -- rust = require("dap.lldb"),
    -- cpp = require("dap.lldb"),
    -- c = require("dap.lldb"),
    -- go = require("dap.go"),
    -- python = require("dap.python"),
}
-- 设置调试器
for dap_name, dap_options in pairs(dap_config) do
<<<<<<< HEAD
    dap.adapters = dap_options.adapters
=======
    if dap_name == 'rust' or dap_name == 'c' or dap_name == 'cc' or dap_name == 'cpp' then
        dap.adapters = dap_options.adapters;
    else
        dap.adapters[dap_name] = dap_options.adapters
    end
>>>>>>> 7d6c33b5fe6e15e9d088b9b91bae393a473d21a4
    dap.configurations[dap_name] = dap_options.configurations
end


