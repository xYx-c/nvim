-- https://github.com/uga-rosa/translate.nvim

-- 安装trans命令行工具
-- brew install gawk
-- $ git clone https://github.com/soimort/translate-shell
-- $ cd translate-shell/
-- $ make
-- $ [sudo] make install

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
            },
            floating = {
                zindex = 9999, -- a large number
            },
        }
    }
}

require("translate").setup(options)
