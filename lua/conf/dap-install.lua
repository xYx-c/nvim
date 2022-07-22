-- https://github.com/ravenxrz/DAPInstall.nvim
local dap_install = require "dap-install"
-- require 'dap.di_lldb'.init(dap_install)
-- require 'dap.di_go'.init(dap_install)
-- require 'dap.di_python'.init(dap_install)

dap_install.setup({
    installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

