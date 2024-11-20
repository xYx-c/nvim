-- https://github.com/lucaspellegrinelli/rip.nvim

local rip = require("rip")
rip.setup({
    keybinds = {
        toggle_mark = "x",        -- (Un)Selecting a specific occurences or files to be replaced
        toggle_collapse = "z",    -- (Un)Collapsing the occurences of a specific file
        toggle_mark_all = "a",    -- (Un)Selecting all the occurences found in all files
        confirm_replace = "<CR>", -- Close the window and replacing all selected occurences
        cancel_replace = "<ESC>", -- Close the window and NOT replacing any occurences
    },
    window = {
        highlight_color = "#e9b565", -- Color of the matched string in the popup
    }
})
