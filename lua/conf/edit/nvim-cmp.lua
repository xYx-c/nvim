-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/vim-vsnip
-- https://github.com/hrsh7th/cmp-vsnip
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/hrsh7th/cmp-cmdline
-- https://github.com/f3fora/cmp-spell
-- https://github.com/rafamadriz/friendly-snippets
-- https://github.com/lukas-reineke/cmp-under-comparator

-- https://github.com/tzachar/cmp-tabnine

-- 当出现：
--    TabNine is not executable
-- 等字样时，需要手动执行（仅限 Manjaro）：
--    rm ~/.local/share/nvim/plugged/cmp-tabnine/binaries
--    ~/.local/share/nvim/plugged/cmp-tabnine/install.sh

local cmp = require("cmp")
local lspkind = require("lspkind")
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

vim.g.vsnip_snippet_dir = "~/.config/nvim/snippets"
cmp.setup(
---@diagnostic disable-next-line: redundant-parameter
    {
        -- 指定补全引擎
        snippet = {
            expand = function(args)
                -- 使用 vsnip 引擎
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        -- 指定补全源（安装了补全源插件就在这里指定）
        sources = cmp.config.sources(
            {
                { name = "nvim_lsp" },
                { name = "vsnip" },
                { name = "path" },
                { name = "buffer" },
                { name = "cmdline" },
                { name = "spell" },
                -- {name = "cmp_tabnine"}
            }
        ),
        -- 格式化补全菜单
        formatting = {
            format = lspkind.cmp_format(
                {
                    with_text = true,
                    maxwidth = 50,
                    before = function(entry, vim_item)
                        vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                        return vim_item
                    end
                }
            )
        },
        -- 对补全建议排序
        sorting = {
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,
                cmp.config.compare.recently_used,
                require("cmp-under-comparator").under,
                -- require("cmp_tabnine.compare"),
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order
            }
        },
        -- 绑定补全相关的按键
        mapping = {
            -- 上一个
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<up>"] = cmp.mapping.select_prev_item(),
            -- 下一个
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<down>"] = cmp.mapping.select_next_item(),
            -- 选择补全
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            --  出现或关闭补全
            ["<C-h>"] = cmp.mapping(
                {
                    i = function()
                        if cmp.visible() then
                            cmp.abort()
                        else
                            cmp.complete()
                        end
                    end,
                    c = function()
                        if cmp.visible() then
                            cmp.close()
                        else
                            cmp.complete()
                        end
                    end
                }
            ),
            -- ["<Tab>"] = cmp.mapping(
            --     function(fallback)
            --         if cmp.visible() then
            --             local entry = cmp.get_selected_entry()
            --             if not entry then
            --                 cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            --             end
            --             cmp.confirm()
            --         else
            --             fallback()
            --         end
            --     end,
            --     { "i", "s", "c" }
            -- )
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif vim.fn["vsnip#available"](1) == 1 then
                    feedkey("<Plug>(vsnip-expand-or-jump)", "")
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkey("<Plug>(vsnip-jump-prev)", "")
                end
            end, { "i", "s" }),
        }
    }
)
-- 命令行 / 模式提示
cmp.setup.cmdline(
    "/",
    {
        sources = {
            { name = "buffer" }
        }
    }
)
-- 命令行 : 模式提示
cmp.setup.cmdline(
    ":",
    {
        sources = cmp.config.sources(
            {
                { name = "path" }
            },
            {
                { name = "cmdline" }
            }
        )
    }
)
