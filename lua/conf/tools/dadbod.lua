-- https://github.com/tpope/vim-dadbod
-- https://github.com/kristijanhusak/vim-dadbod-ui
-- https://github.com/kristijanhusak/vim-dadbod-completion


vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_win_position = 'right'
vim.g.db_ui_execute_on_save = 0

vim.g.db_ui_auto_execute_table_helpers = 1

vim.g.db_ui_default_query = 'select * from {table} limit 100;'
vim.g.db_ui_table_helpers = {
    mysql = {
        ['List'] = 'select * from {table} limit 100;',
    },
    postgresql = {
        ['List'] = 'select * from {table} limit 100;',
    }
}

-- 小写关键字
vim.g.vim_dadbod_completion_lowercase_keywords = 1

vim.g.db_ui_show_help = 0
