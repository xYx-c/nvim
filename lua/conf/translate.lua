-- local options = {
--     default = {
--         command = "translate_shell",
--         output = "floating",
--         parse_before = "trim",
--         parse_after = "oneline",
--     },
--     preset = {
--         output = {
--             split = {
--                 min_size = 8
--             }
--         }
--     }
-- }
local options = {
    default = {
        command = "translate_shell",
        output = "floating",
        parse_after = "no_handle",
        parse_before = "trim",
    },
    preset = {
        output = {
            split = {
                min_size = 8
            }
        }
    }
}

require("translate").setup(options)
