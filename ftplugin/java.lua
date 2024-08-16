vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = 2

local config = require("conf.lsp.jdtls")
require('jdtls').start_or_attach(config)


