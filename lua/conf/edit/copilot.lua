-- https://github.com/github/copilot.vim
vim.g.copilot_no_tab_map = true

-- vim.g.copilot_node_command = '/usr/local/node18/bin/node'
if os.execute("cd /usr/local/node18/bin >/dev/null 2>&1") == 0 then
    vim.g.copilot_node_command = '/usr/local/node18/bin/node'
end
-- 使用 C-l 确认补全
-- 使用 M-[ 查看上一个补全
-- 使用 M-[ 查看下一个补全
-- 使用 C-[ 关闭补全
