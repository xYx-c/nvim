-- https://github.com/nvim-lualine/lualine.nvim

-- tmux 信息展示逻辑，状态栏显隐交给 tmux hook 处理
local tmux_state = {
    cache = {
        session = '',
        windows = '',
    },
    timer = nil,
}

local function in_tmux()
    return vim.env.TMUX ~= nil and vim.env.TMUX ~= ''
end

local function tmux(args)
    if not in_tmux() then
        return nil
    end

    local cmd = { 'tmux' }
    vim.list_extend(cmd, args)

    local result = vim.system(cmd, { text = true }):wait()
    if result.code ~= 0 then
        return nil
    end

    return vim.trim(result.stdout or '')
end

local function get_tmux_value(format)
    return tmux({ 'display-message', '-p', format }) or ''
end

local function set_tmux_status(visible)
    if not in_tmux() then
        return
    end

    tmux({ 'set-option', '-q', 'status', visible and 'on' or 'off' })
end

local function set_tmux_window_merged(enabled)
    if not in_tmux() then
        return
    end

    if enabled then
        tmux({ 'set-window-option', '-q', '@nvim_lualine', '1' })
        return
    end

    tmux({ 'set-window-option', '-qu', '@nvim_lualine' })
end

local function split_lines(value)
    local lines = {}
    for line in (value .. '\n'):gmatch('(.-)\n') do
        if line ~= '' then
            table.insert(lines, line)
        end
    end
    return lines
end

local function format_tmux_path(path)
    if path == nil or path == '' then
        return ''
    end

    -- return vim.fn.fnamemodify(path, ':~')
    return vim.fn.fnamemodify(path, ':~'):match('[^/]+$')
end

local function format_tmux_window_label(name, flags, command, path)
    local flag_text = flags and flags ~= '' and flags ~= '-' and (' ' .. flags) or ''

    if command == 'nvim' or command == 'vim' then
        local display_path = format_tmux_path(path)
        if display_path ~= '' then
            return string.format('%s [%s]%s', name, display_path, flag_text)
        end
    end

    return string.format('%s%s', name, flag_text)
end

local function format_tmux_window_highlight(is_active, label)
    local group = is_active == '1' and 'LualineTmuxWindowActive' or 'LualineTmuxWindowInactive'
    return string.format('%%#%s# %s %%*', group, label)
end

local function format_windows_overview()
    local raw = tmux({
        'list-windows',
        '-F',
        '#I\t#W\t#{window_active}\t#{window_flags}\t#{pane_current_command}\t#{pane_current_path}',
    }) or ''

    local items = {}
    for _, line in ipairs(split_lines(raw)) do
        local index, name, is_active, flags, command, path = line:match('^(.-)\t(.-)\t(.-)\t(.-)\t(.-)\t(.-)$')
        if index and name then
            local label = format_tmux_window_label(name, flags, command, path)
            local text = string.format(' %s:%s', index, label)
            table.insert(items, format_tmux_window_highlight(is_active, text))
        end
    end

    return table.concat(items, '')
end

local function refresh_tmux_cache()
    if not in_tmux() then
        tmux_state.cache = {
            session = '',
            windows = '',
        }
        return
    end

    tmux_state.cache = {
        session = get_tmux_value('#S'),
        windows = format_windows_overview(),
    }
end

local function redraw_status()
    vim.schedule(function()
        pcall(function()
            vim.cmd('redrawstatus')
        end)
    end)
end

local function start_tmux_refresh_timer()
    if tmux_state.timer ~= nil or not in_tmux() then
        return
    end

    tmux_state.timer = vim.fn.timer_start(300, function()
        if not in_tmux() then
            return
        end
        refresh_tmux_cache()
        redraw_status()
    end, { ['repeat'] = -1 })
end

local function setup_tmux_autocmds()
    if not in_tmux() then
        return
    end

    local group = vim.api.nvim_create_augroup('TmuxStatusCache', { clear = true })

    vim.api.nvim_create_autocmd({ 'VimEnter', 'VimResume' }, {
        group = group,
        callback = function()
            set_tmux_window_merged(true)
            set_tmux_status(false)
            refresh_tmux_cache()
            redraw_status()
        end,
    })

    vim.api.nvim_create_autocmd({ 'VimLeavePre', 'VimSuspend' }, {
        group = group,
        callback = function()
            set_tmux_window_merged(false)
            set_tmux_status(true)
        end,
    })

    vim.api.nvim_create_autocmd('CursorHold', {
        group = group,
        callback = function()
            refresh_tmux_cache()
            redraw_status()
        end,
    })
end

local function setup_tmux_bridge()
    if not in_tmux() then
        return
    end

    set_tmux_window_merged(true)
    set_tmux_status(false)
    refresh_tmux_cache()
    start_tmux_refresh_timer()
    setup_tmux_autocmds()
end

local function tmux_component()
    if not in_tmux() then
        return ''
    end

    local session = tmux_state.cache.session ~= '' and (' ' .. tmux_state.cache.session) or ''
    local windows = tmux_state.cache.windows ~= '' and (tmux_state.cache.windows) or ''

    local parts = {}
    if session ~= '' then
        table.insert(parts, session)
    end
    if windows ~= '' then
        table.insert(parts, windows)
    end

    return table.concat(parts, ' |')
end

setup_tmux_bridge()

local colors = {
    blue = '#80a0ff',
    cyan = '#6A9589',
    -- black  = '#3c3836',
    black = '#32302f',
    white = '#c6c6c6',
    red = '#ff5189',
    -- violet = '#d183e8',
    violet = '#957FB8',
    grey = '#504945',
}


local function setup_tmux_highlights()
    -- vim.api.nvim_set_hl(0, 'LualineTmuxWindowActive', { fg = colors.white, bg = colors.black, bold = true }) 
    vim.api.nvim_set_hl(0, 'LualineTmuxWindowActive', { bg = '#EBDBB2', fg = colors.grey, bold = true })
    -- vim.api.nvim_set_hl(0, 'LualineTmuxWindowInactive', { fg = colors.white, bg = colors.grey })
    vim.api.nvim_set_hl(0, 'LualineTmuxWindowInactive', { bg = '#EBDBB2', fg = colors.grey })
end

setup_tmux_highlights()

local bubbles_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.black, bg = colors.black },
    },
    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.cyan } },
    replace = { a = { fg = colors.black, bg = colors.red } },
    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
    },
}

local tmux_lualine_component = {
    tmux_component,
    -- color = { fg = colors.white, bg = colors.grey },
    color = { bg = '#EBDBB2', fg= colors.grey },
    -- separator = { left = '', right = '' },
    padding = { left = 1, right = 1 },
    cond = function()
        return in_tmux()
    end,
}

require('lualine').setup {
    options = {
        theme = vim.o.background == 'dark' and bubbles_theme or 'gruvbox',
        component_separators = '|',
        section_separators = { left = '', right = '' },
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            { 'mode', right_padding = 2 },
        },
        lualine_b = {
            'filename',
            'branch',
            'diagnostics',
        },
        lualine_c = {
            tmux_lualine_component,
        },
        lualine_x = {},
        lualine_y = {
            'encoding',
            {
                'lsp_progress',
                separators = {
                    component = ' ',
                    progress = ' | ',
                    percentage = { pre = '', post = '%% ' },
                    title = { pre = '', post = ': ' },
                    lsp_client_name = { pre = '[', post = ']' },
                    spinner = { pre = '', post = '' },
                    use = true,
                    message = { pre = '(', post = ')', commenced = 'In Progress', completed = 'Completed' },
                },
                display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
                timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
            },
            'filetype',
            'progress',
        },
        lualine_z = {
            { 'location', left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
}
