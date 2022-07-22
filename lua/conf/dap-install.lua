-- https://github.com/ravenxrz/DAPInstall.nvim
local dap_install = require "dap-install"
-- dap_install.config("codelldb", {})
-- dap_install.config("go", {})
-- dap_install.config("python", {})

dap_install.setup({
    installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})

