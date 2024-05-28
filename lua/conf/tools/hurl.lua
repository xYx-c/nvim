-- https://github.com/jellydn/hurl.nvim

-- brew install hurl 
-- or 
-- https://github.com/Orange-OpenSource/hurl

require('hurl').setup({
    env_file = { 'hurl.env' },
    mode = 'popup',
    formatters = {
        json = { 'jq' }, -- Customize the JSON formatter command
        html = {
            'prettier',  -- Customize the HTML formatter command
            '--parser',
            'html',
        },
    },
})
