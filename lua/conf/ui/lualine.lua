-- https://github.com/nvim-lualine/lualine.nvim

-- tmux 状态栏桥接逻辑，直接内联到 lualine 配置中
local tmux_state = {
    cache = {
        session = '',
        windows = '',
    },
    last_status = nil,
    timer = nil,
    pane_id = nil,
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

local function get_tmux_target_value(target, format)
    if not target or target == '' then
        return ''
    end
    return tmux({ 'display-message', '-p', '-t', target, format }) or ''
end

local function get_tmux_session_option(name)
    return tmux({ 'show-options', '-qv', '@' .. name }) or ''
end

local function set_tmux_session_option(name, value)
    tmux({ 'set-option', '-q', '@' .. name, value })
end

local function unset_tmux_session_option(name)
    tmux({ 'set-option', '-qu', '@' .. name })
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

local function format_windows_overview()
    local raw = tmux({
        'list-windows',
        '-F',
        '#I\t#W\t#{window_active}\t#{window_flags}',
    }) or ''

    local items = {}
    for _, line in ipairs(split_lines(raw)) do
        local index, name, _, flags = line:match('^(.-)\t(.-)\t(.-)\t(.-)$')
        if index and name then
            local flag_text = flags and flags ~= '' and (' ' .. flags) or ''
            table.insert(items, string.format('%s:%s%s', index, name, flag_text))
        end
    end

    return table.concat(items, '  ')
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

local function set_tmux_status(visible)
    if not in_tmux() then
        return
    end

    local value = visible and 'on' or 'off'
    if tmux_state.last_status == value then
        return
    end

    tmux({ 'set-option', '-q', 'status', value })
    if visible then
        tmux({ 'set-option', '-q', 'status-position', 'bottom' })
    end
    tmux_state.last_status = value
end

local function redraw_status()
    vim.schedule(function()
        pcall(function()
            vim.cmd('redrawstatus')
        end)
    end)
end

-- 通过 pane_id 协调多个 nvim 实例，尽量避免同 session 下互相打架
local function reconcile_tmux_status()
    if not in_tmux() or not tmux_state.pane_id then
        return
    end

    local owner_key = 'nvim_lualine_owner'
    local owner = get_tmux_session_option(owner_key)
    local is_active = get_tmux_target_value(tmux_state.pane_id, '#{window_active}') == '1'

    if is_active then
        if owner ~= tmux_state.pane_id then
            set_tmux_session_option(owner_key, tmux_state.pane_id)
        end
        set_tmux_status(false)
        return
    end

    if owner == tmux_state.pane_id then
        set_tmux_status(true)
        unset_tmux_session_option(owner_key)
    end
end

local function release_tmux_status()
    if not in_tmux() or not tmux_state.pane_id then
        return
    end

    local owner_key = 'nvim_lualine_owner'
    if get_tmux_session_option(owner_key) == tmux_state.pane_id then
        set_tmux_status(true)
        unset_tmux_session_option(owner_key)
    end
end

local function start_tmux_refresh_timer()
    if tmux_state.timer ~= nil or not in_tmux() then
        return
    end

    tmux_state.timer = vim.fn.timer_start(120, function()
        if not in_tmux() then
            return
        end
        refresh_tmux_cache()
        reconcile_tmux_status()
        redraw_status()
    end, { ['repeat'] = -1 })
end

local function setup_tmux_autocmds()
    if not in_tmux() then
        return
    end

    local group = vim.api.nvim_create_augroup('TmuxStatusBridge', { clear = true })

    vim.api.nvim_create_autocmd({ 'VimEnter', 'VimResume', 'FocusGained' }, {
        group = group,
        callback = function()
            refresh_tmux_cache()
            reconcile_tmux_status()
            redraw_status()
        end,
    })

    vim.api.nvim_create_autocmd({ 'FocusLost', 'VimSuspend', 'VimLeavePre' }, {
        group = group,
        callback = function()
            release_tmux_status()
        end,
    })

    vim.api.nvim_create_autocmd('CursorHold', {
        group = group,
        callback = function()
            refresh_tmux_cache()
            reconcile_tmux_status()
            redraw_status()
        end,
    })
end

local function setup_tmux_bridge()
    if not in_tmux() then
        return
    end

    tmux({ 'set-option', '-q', 'focus-events', 'on' })
    tmux({ 'set-option', '-q', 'status-position', 'bottom' })
    tmux_state.pane_id = get_tmux_value('#{pane_id}')
    refresh_tmux_cache()
    reconcile_tmux_status()
    start_tmux_refresh_timer()
    setup_tmux_autocmds()
end

local function tmux_component()
    if not in_tmux() then
        return ''
    end

    local session = tmux_state.cache.session ~= '' and (' ' .. tmux_state.cache.session) or ''
    local windows = tmux_state.cache.windows ~= '' and (' ' .. tmux_state.cache.windows) or ''

    local parts = {}
    if session ~= '' then
        table.insert(parts, session)
    end
    if windows ~= '' then
        table.insert(parts, windows)
    end

    return table.concat(parts, '  |  ')
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
    color = { fg = colors.white, bg = colors.grey },
    separator = { left = '', right = '' },
    padding = { left = 1, right = 1 },
    cond = function()
        return in_tmux()
    end,
}

-- local custom_gruvbox = require 'lualine.themes.gruvbox'
-- custom_gruvbox.visual.c.bg = '#bdae93'

require('lualine').setup {
    options = {
        -- theme = bubbles_theme,
        theme = vim.o.background == 'dark' and bubbles_theme or 'gruvbox',
        component_separators = '|',
        section_separators = { left = '', right = '' },
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            -- { 'mode', separator = { left = '' }, right_padding = 2 },
            { 'mode', right_padding = 2 },
        },
        lualine_b = {
            'filename',
            -- 'diff',
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
            -- { 'location', separator = { right = '' }, left_padding = 2 },
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
