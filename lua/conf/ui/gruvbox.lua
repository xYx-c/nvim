-- https://github.com/ellisonleao/gruvbox.nvim

require("gruvbox").setup({
    terminal_colors = true,
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
    inverse = true,
    contrast = "",
    overrides = {
        CursorLine                       = { bg = vim.o.background == "dark" and "#303030" or "#F5E9C2" },
        SignColumn                       = { bg = "NONE" },
        GruvboxRedSign                   = { bg = "NONE" },
        GruvboxGreenSign                 = { bg = "NONE" },
        GruvboxYellowSign                = { bg = "NONE" },
        GruvboxBlueSign                  = { bg = "NONE" },
        GruvboxPurpleSign                = { bg = "NONE" },
        GruvboxAquaSign                  = { bg = "NONE" },
        GruvboxOrangeSign                = { bg = "NONE" },

        AvanteConflictCurrent            = { fg = "#f9f5d7", bg = "#cc241d", bold = true, },
        AvanteConflictCurrentLabel       = { fg = "#f9f5d7", bg = "#fb4934", bold = true, },
        AvanteConflictIncoming           = { fg = "#f9f5d7", bg = "#458588", bold = true, },
        AvanteConflictIncomingLabel      = { fg = "#f9f5d7", bg = "#83a598", bold = true, },
        AvanteToBeDeleted                = { fg = "#f9f5d7", bg = "#9d0006", strikethrough = true, },
        AvanteToBeDeletedWOStrikethrough = { fg = "#f9f5d7", bg = "#9d0006", },
    },
    dim_inactive = false,
    transparent_mode = false,
})

vim.cmd("colorscheme gruvbox")
