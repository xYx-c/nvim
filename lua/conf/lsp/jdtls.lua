-- https://github.com/mfussenegger/nvim-jdtls
local java = os.getenv("JDK_HOME")
local home = os.getenv("HOME")
local system = io.popen("uname -s"):read("*l")
if system == "Darwin" then
    system = "mac"
elseif system == "Linux" then
    system = "linux"
else
    system = "windows"
end
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = home .. '/.jdtls_data/' .. project_name

local on_attach = function(client, bufnr)
    -- Mappings.
    require('keybinds').lsp_maps(client, bufnr)

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- Java specific
    buf_set_keymap("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", vim.keybinds.opts)
    buf_set_keymap("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", vim.keybinds.opts)
    buf_set_keymap("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", vim.keybinds.opts)
    buf_set_keymap("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", vim.keybinds.opts)
    buf_set_keymap("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", vim.keybinds.opts)
    buf_set_keymap("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", vim.keybinds.opts)

    -- debug
    -- require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    require('jdtls').setup_dap()

    require('jdtls.dap').setup_dap_main_class_configs()
    require('jdtls.setup').add_commands()
end

local bundles = {
    vim.fn.glob(home ..
        "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
};
vim.list_extend(bundles,
    vim.split(vim.fn.glob(home .. ".local/share/nvim/mason/packages/java-test/extension/server/*.jar"), "\n"))

local launcher = vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")

return {
    flags = { allow_incremental_sync = true },
    name = 'jdtls',
    filetypes = { 'java' },
    cmd = {
        java .. '/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1G',
        '-Xmx2G',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:' .. home .. '/.local/share/nvim/mason/packages/jdtls/lombok.jar',
        -- '-Xbootclasspath/a:' .. home .. '/.local/share/nvim/mason/packages/jdtls/lombok.jar',
        '-jar', launcher,
        '-configuration', home .. '/.local/share/nvim/mason/packages/jdtls/config_' .. system,
        '-data', workspace_dir,
    },

    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),

    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    -- root_dir = require('jdtls.setup').find_root({'mvnw', 'gradlew', 'pom.xml'}),

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-1.8",
                        path = os.getenv("JAVA_HOME"),
                        default = true,
                    },
                    {
                        name = "JavaSE-17",
                        path = os.getenv("JDK_HOME")
                    },
                },
                maven = {
                    userSettings = os.getenv("HOME") .. "/.m2/settings.xml",
                    globalSettings = os.getenv("MAVEN_HOME") .. "/conf/settings.xml",
                }
            },
            saveActions = {
                organizeImports = true,
            },
            -- maven = {
            --     downloadSources = true,
            -- },
            -- eclipse = {
            --     downloadSources = true,
            -- }
        },
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        bundles = bundles,
        -- extendedClientCapabilities = {
        --     progressReportProvider = true,
        -- },
    },
}
