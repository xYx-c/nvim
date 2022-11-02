-- https://github.com/catppuccin/nvim
require("catppuccin").setup {
    -- mocha, macchiato, frappe, latte
    flavour = "frappe",
    transparent_background = true,
    -- term_colors = true,
}
vim.api.nvim_command "colorscheme catppuccin"
