-- https://github.com/yetone/avante.nvim

local session_skill_prompt = nil

local function get_skill_dirs()
    -- 返回 skill 查找目录，项目目录优先于全局目录
    return {
        vim.fn.getcwd() .. "/.skills",
        vim.fn.expand("~/.config/nvim/skills"),
    }
end

local function read_skill_file(path)
    -- 读取 skill 文件内容用于快捷提示词
    local ok, lines = pcall(vim.fn.readfile, path)
    if not ok then return nil end
    return table.concat(lines, "\n")
end

local function find_skill_file(skill_name)
    -- 按文件名查找会话级 skill 文件
    local target = skill_name:gsub("%.md$", ""):lower()

    for _, dir in ipairs(get_skill_dirs()) do
        if vim.uv.fs_stat(dir) then
            for name, type in vim.fs.dir(dir, { depth = math.huge }) do
                if type == "file" and name:sub(-3):lower() == ".md" then
                    local path = dir .. "/" .. name
                    local filename = vim.fn.fnamemodify(path, ":t:r"):lower()
                    if filename == target then return path end
                end
            end
        end
    end
end

local function complete_skill_names(arg_lead)
    -- 补全可用于新会话的 skill 名称
    local names_by_key = {}
    local prefix = (arg_lead or ""):lower()

    for _, dir in ipairs(get_skill_dirs()) do
        if vim.uv.fs_stat(dir) then
            for name, type in vim.fs.dir(dir, { depth = math.huge }) do
                if type == "file" and name:sub(-3):lower() == ".md" then
                    local filename = vim.fn.fnamemodify(name, ":t:r")
                    local key = filename:lower()
                    if key:find(prefix, 1, true) == 1 then names_by_key[key] = filename end
                end
            end
        end
    end

    local names = vim.tbl_values(names_by_key)
    table.sort(names)
    return names
end

local function load_skill_shortcuts()
    -- 递归加载项目和全局 skill 文件为 Avante shortcuts
    local dirs = {
        vim.fn.expand("~/.config/avante/skills"),
        vim.fn.getcwd() .. "/.skills",
    }
    local shortcuts_by_name = {}

    for _, dir in ipairs(dirs) do
        if vim.uv.fs_stat(dir) then
            local files = {}
            for name, type in vim.fs.dir(dir, { depth = math.huge }) do
                if type == "file" and name:sub(-3):lower() == ".md" then
                    table.insert(files, dir .. "/" .. name)
                end
            end
            table.sort(files)

            for _, path in ipairs(files) do
                local filename = vim.fn.fnamemodify(path, ":t:r")
                local prompt = read_skill_file(path)
                if prompt and prompt ~= "" then
                    shortcuts_by_name[filename] = {
                        name = filename,
                        description = "Skill: " .. filename,
                        details = path,
                        prompt = prompt,
                    }
                end
            end
        end
    end

    local shortcuts = {}
    for _, shortcut in pairs(shortcuts_by_name) do
        table.insert(shortcuts, shortcut)
    end
    table.sort(shortcuts, function(a, b) return a.name < b.name end)
    return shortcuts
end

require("avante").setup({
    provider = "home",
    providers = {
        home = {
            __inherited_from = "openai",
            endpoint = "http://ionmm.com:8317/v1",
            -- model = "claude",
            -- model = "gemini",
            model = "codex",
            api_key_name = "HOME_API_KEY",
        },
    },
    acp_providers = {
        ["gemini-cli"] = {
            command = "gemini",
            args = { "--experimental-acp" },
            env = {
                NODE_NO_WARNINGS = "1",
                GEMINI_API_KEY = os.getenv("GEMINI_API_KEY"),
            },
        },
    },
    rules = {
        project_dir = ".skills",
        global_dir = "~/.config/nvim/skills",
    },
    system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        local mcp_prompt = ""
        if hub then mcp_prompt = hub:get_active_servers_prompt() end

        local prompt = mcp_prompt .. [[
            # Coding Style Rules
            Add simplified Chinese comments to the classes, functions, and methods you write.
            Requirements:
            - Use concise and clear Simplified Chinese.
            - Avoid lengthy explanations.
            - Focus on purpose and behavior.
            - Only comment public APIs, classes, functions, and methods.
            - Do not comment every line of code.

            # Tool Usage Rules
            Prefer MCP tools and resources when they are available and relevant.
            Fall back to built-in tools only when MCP cannot satisfy the request.

        ]]

        if session_skill_prompt and session_skill_prompt ~= "" then
            prompt = prompt .. "\n\n# Session Skill\n\n" .. session_skill_prompt
        end

        return prompt
    end,
    shortcuts = load_skill_shortcuts(),
    override_prompt_dir = function()
        return vim.fn.stdpath("config") .. "/avante"
    end,
    custom_tools = function()
        return {
            require("mcphub.extensions.avante").mcp_tool(),
        }
    end,
    disabled_tools = {
        "list_files",
        "search_files",
        "read_file",
        "create_file",
        "rename_file",
        "delete_file",
        "create_dir",
        "rename_dir",
        "delete_dir",
    },
    -- behaviour = {
    --     auto_approve_tool_permissions = false,
    -- },
})

pcall(vim.api.nvim_del_user_command, "AvanteChatNew")
vim.api.nvim_create_user_command("AvanteChatNew", function(opts)
    local fargs = vim.list_slice(opts.fargs)
    local skill_name = fargs[1]

    if skill_name and not skill_name:find("=", 1, true) then
        table.remove(fargs, 1)
        local skill_path = find_skill_file(skill_name)
        if not skill_path then
            vim.notify("Avante skill not found: " .. skill_name, vim.log.levels.ERROR)
            return
        end

        session_skill_prompt = read_skill_file(skill_path)
        if not session_skill_prompt or session_skill_prompt == "" then
            vim.notify("Avante skill is empty: " .. skill_path, vim.log.levels.ERROR)
            return
        end
        vim.notify("Avante skill loaded: " .. vim.fn.fnamemodify(skill_path, ":t:r"), vim.log.levels.INFO)
    else
        session_skill_prompt = nil
    end

    local args = require("avante.utils").parse_args(fargs)
    local provider = args.provider
    local model = args.model
    args.provider = nil
    args.model = nil

    if provider then require("avante.providers").refresh(provider) end
    if model then
        local config = require("avante.config")
        local providers = require("avante.providers")
        local target_provider = provider or config.provider
        ---@cast target_provider string
        config.override({
            providers = {
                [target_provider] = vim.tbl_deep_extend(
                    "force",
                    config.get_provider_config(target_provider),
                    { model = model }
                ),
            },
        })
        if providers[target_provider] then providers[target_provider].model = model end
        config.save_last_model(model, target_provider)
        vim.notify("Avante model selected: " .. target_provider .. "/" .. model, vim.log.levels.INFO)
    end

    args.ask = false
    args.new_chat = true
    require("avante.api").ask(args)
end, {
    desc = "avante: create new chat with optional skill",
    nargs = "*",
    complete = function(arg_lead)
        return complete_skill_names(arg_lead)
    end,
})

require("mcphub").setup({
    auto_approve = true,
    -- extensions = {
    --     avante = {
    --         make_slash_commands = true,
    --     }
    -- },
})
