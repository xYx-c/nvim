-- https://github.com/yetone/avante.nvim
-- https://text.pollinations.ai/models

require("avante").setup({
    provider = "kfc",
    providers = {
        pub = {
            __inherited_from = "openai",
            endpoint = "https://529961.com/v1",
            model = "claude-opus-4-5-20251101",
            api_key_name = "PUB_API_KEY",
        },
        netlib = {
            __inherited_from = "openai",
            -- endpoint = "https://newapi.netlib.re/v1",
            endpoint = "https://wzw.de5.net/v1",
            model = "claude-opus-4-5-20251101",
            api_key_name = "NETLIB_API_KEY",
        },
        kfc = {
            __inherited_from = "openai",
            endpoint = "https://kfc-api.sxxe.net/v1",
            model = "cursor2-claude-4.1-opus",
            api_key_name = "KFC_API_KEY",
        },
        bohe = {
            __inherited_from = "openai",
            endpoint = "https://x666.me/v1",
            model = "gemini-flash-latest",
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
