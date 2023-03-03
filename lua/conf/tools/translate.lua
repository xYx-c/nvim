-- https://github.com/uga-rosa/translate.nvim

-- 安装trans命令行工具
-- brew install gawk
-- $ git clone https://github.com/soimort/translate-shell
-- $ cd translate-shell/
-- $ make
-- $ [sudo] make install

local proxy = os.execute("pgrep -x clash > /dev/null");
local function args()
    if proxy then
        return { "-x", "http://127.0.0.1:7890" }
    -- else
        -- return { "-e", "bing" }
    end
end

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
        },
        command = {
            translate_shell = {
                args = args(),
            },
        }
    }
}

require("translate").setup(options)
