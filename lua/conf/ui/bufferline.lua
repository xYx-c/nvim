-- https://github.com/akinsho/bufferline.nvim
require("bufferline").setup(
    {
        options = {
            -- 为每个 buffer 都配置一个序数
            numbers = "ordinal",
            -- 使用内置 LSP 进行诊断
            diagnostics = "nvim_lsp",
            enforce_regular_tabs = false,

            -- 是否添加文件类型图标高
            color_icons = false,

            show_buffer_icons = false,
            show_buffer_close_icons = false,
            show_buffer_default_icon = false,
            show_close_icon = false,
            groups = {
                options = {
                    toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
                },
                items = {
                    {
                        name = "Tests", -- Mandatory
                        highlight = { gui = "underline", guisp = "blue" }, -- Optional
                        priority = 2, -- determines where it will appear relative to other groups (Optional)
                        icon = "", -- Optional
                        matcher = function(buf) -- Mandatory
                            return buf.name:match('%_test') or buf.name:match('%_spec')
                        end,
                    },
                    {
                        name = "Docs",
                        highlight = { gui = "undercurl", guisp = "green" },
                        auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
                        matcher = function(buf)
                            return buf.name:match('%.md') or buf.name:match('%.txt')
                        end,
                        separator = { -- Optional
                            style = require('bufferline.groups').separator.tab
                        },
                    }
                }
            },
            -- 分割符样式："slant" | "thick" | "thin"
            -- separator_style = "slant",
            -- 左侧让出 nvim-tree 的位置
            -- offsets = {
            --     {
            --         filetype = "NvimTree",
            --         text = "File Explorer",
            --         highlight = "Directory",
            --         text_align = "left"
            --     }
            -- },
            -- custom_filter = function(buf_number, _)
            --     if string.find(vim.fn.bufname(buf_number), 'term://') == nil then
            --         return true
            --     else
            --         return false
            --     end
            -- end,
            -- 显示 LSP 报错图标
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local icon = level:match("error") and " " or " "
                if context.buffer:current() then
                    return ''
                end
                return " " .. icon .. count
            end
            -- diagnostics_indicator = function(_, _, diagnostics_dict, _)
            --     local s = " "
            --     for e, n in pairs(diagnostics_dict) do
            --         local sym = e == "error" and "" or (e == "warning" and "" or "")
            --         s = s .. n .. sym
            --     end
            --     return s
            -- end
        }
    }
)
