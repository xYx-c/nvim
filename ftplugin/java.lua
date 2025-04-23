vim.bo.expandtab = true
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.softtabstop = 4

require 'jdtls'.start_or_attach(require 'conf.lsp.jdtls')
