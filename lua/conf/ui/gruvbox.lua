-- https://github.com/ellisonleao/gruvbox.nvim

local palette = require("gruvbox").palette

local palette_overrides = function()
    if vim.o.background == "dark" then
        return {
            dark1 = palette.dark0,
        }
    else
        return {
            light1 = palette.light0,
        }
    end
end

local overrides = function()
    if vim.o.background == "dark" then
        return {
            SignColumn = { bg = palette.dark0 },
            CursorLine = { bg = "#303030" },
            NormalFloat = { bg = "#3c3836" },
        }
    else
        return {
            SignColumn = { bg = palette.light0 },
            CursorLine = { bg = "#F5E9C2" },
            NormalFloat = { bg = "#EBDBB2" },
        }
    end
end

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
    palette_overrides = palette_overrides(),
    overrides = overrides(),
    dim_inactive = false,
    transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
