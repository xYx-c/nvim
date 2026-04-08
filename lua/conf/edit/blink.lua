-- https://github.com/saghen/blink.cmp

require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/snippets/luasnip" } })
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets/vsnip" } })

require("blink.cmp").setup({
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        per_filetype = {
            sql = { 'snippets', 'dadbod', 'buffer' },
        },
        providers = {
            dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
            -- dadbod_grip = { name = "Grip SQL", module = "dadbod-grip.completion.blink" },
        },
    },
    keymap = {
        ['<C-d>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = {
            function(cmp)
                if cmp.snippet_active() then
                    return cmp.accept()
                else
                    return cmp.select_next()
                end
            end,
            'snippet_forward',
            'fallback'
        },
        ['<S-Tab>'] = {
            function(cmp)
                if not cmp.snippet_active() then
                    return cmp.select_prev()
                end
            end,
            'snippet_backward',
            'fallback'
        },

        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },

    snippets = { preset = 'luasnip' },

    signature = { enabled = true },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    completion = {
        documentation = { auto_show = false },
        -- list = {
        --     selection = {
        --         preselect = function(ctx)
        --             return not require('blink.cmp').snippet_active({ direction = 1 })
        --         end,
        --         auto_insert = function(ctx) return vim.bo.filetype ~= 'markdown' end,
        --     }
        -- }
    },
})
