-- https://github.com/nvim-lualine/lualine.nvim

require('lualine').setup {
    options = {
        -- theme = 'gruvbox-flat',
        component_separators = { right = '|' },
        globalstatus = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            'filename',
            {
                'lsp_progress',
                -- separators = {
                --     component = ' ',
                --     progress = ' | ',
                --     percentage = { pre = '', post = '%% ' },
                --     title = { pre = '', post = ': ' },
                --     lsp_client_name = { pre = '[', post = ']' },
                --     spinner = { pre = '', post = '' },
                --     use = true,
                --     message = { pre = '(', post = ')', commenced = 'In Progress', completed = 'Completed' },
                -- },
                -- display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
                -- timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
            }
        },
        lualine_x = { 'encoding', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
}
