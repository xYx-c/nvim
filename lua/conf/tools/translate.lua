-- https://github.com/uga-rosa/translate.nvim

-- 安装trans命令行工具
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
            }
        }
    }
}

require("translate").setup(options)
