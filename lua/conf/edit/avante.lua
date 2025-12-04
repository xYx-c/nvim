-- https://github.com/yetone/avante.nvim
-- https://text.pollinations.ai/models

require("avante").setup({
    provider = "bohe",
    providers = {
        bohe = {
            __inherited_from = "openai",
            endpoint = "https://x666.me/v1",
            model = "gemini-2.5-flash",
            api_key_name = "BOHE_API_KEY",
        },
        doubao = {
            __inherited_from = "openai",
            endpoint = "https://ark.cn-beijing.volces.com/api/v3",
            model = "doubao-seed-code-preview-251028",
            api_key_name = "DOUBAO_API_KEY",
        },
        pollinations = {
            __inherited_from = "openai",
            endpoint = "https://text.pollinations.ai/openai",
            model = "gemini",
            api_key_name = "POLLINATIONS_API_KEY",
        },
        claude = {
            endpoint = "https://api.anthropic.com",
            model = "claude-sonnet-4-20250514",
            timeout = 30000, -- Timeout in milliseconds
            extra_request_body = {
                temperature = 0.75,
                max_tokens = 20480,
            },
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
    behaviour = {
        auto_approve_tool_permissions = false,
    },
})
