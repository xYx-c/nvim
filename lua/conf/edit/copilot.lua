-- https://github.com/github/copilot.vim
vim.g.copilot_no_tab_map = true

if os.execute("cd /usr/local/node18 >/dev/null 2>&1") == 0 then
    vim.g.copilot_node_command = '/usr/local/node18/bin/node'
elseif os.execute("cd /usr/local/node16 >/dev/null 2>&1") == 0 then
    vim.g.copilot_node_command = '/usr/local/node16/bin/node'
else
    vim.g.copilot_node_command = 'node'
end

-- 使用 C-l 确认补全
-- 使用 M-[ 查看上一个补全
-- 使用 M-[ 查看下一个补全
-- 使用 C-[ 关闭补全
