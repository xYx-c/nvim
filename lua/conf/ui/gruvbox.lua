-- https://github.com/ellisonleao/gruvbox.nvim

local palette = require("gruvbox").palette

require("gruvbox").setup({
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = false,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "",  -- can be "hard", "soft" or empty string
    palette_overrides = {
        dark1 = palette.dark0,
    },
    overrides = {
        SignColumn = { bg = palette.dark0 },
        CursorLine = { bg = "#303030" },
        NormalFloat = { bg = "#3c3836" },
    },
    dim_inactive = false,
    transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
