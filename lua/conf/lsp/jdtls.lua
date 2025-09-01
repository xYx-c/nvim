-- https://github.com/mfussenegger/nvim-jdtls

local java = os.getenv("JDK21")
local home = os.getenv("HOME")
local system = io.popen("uname -s"):read("*l")
if system == "Darwin" then
    system = "mac"
elseif system == "Linux" then
    system = "linux"
else
    system = "windows"
end
local workspace_dir = home .. '/.cache/jdtls/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')


local root_dir = vim.fs.root(0, { ".git", "pom.xml", "mvnw", "gradlew" })

local on_attach = function(client, bufnr)
    -- Mappings.
    require('keybinds').lsp_maps(client, bufnr)

    vim.lsp.inlay_hint.enable()

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- Java specific
    buf_set_keymap("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", vim.keybinds.opts)
    buf_set_keymap("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", vim.keybinds.opts)
    buf_set_keymap("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", vim.keybinds.opts)
    buf_set_keymap("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", vim.keybinds.opts)
    buf_set_keymap("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", vim.keybinds.opts)
    buf_set_keymap("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", vim.keybinds.opts)

    vim.cmd [[command! -buffer JavaTests execute "lua require('jdtls').test_class()"]]
    vim.cmd [[command! -buffer JavaTest execute "lua require('jdtls').test_nearest_method()"]]

    -- debug
    -- require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    require('jdtls').setup_dap()

    require('jdtls.dap').setup_dap_main_class_configs()
end

local bundles = vim.fn.globpath("$MASON/share/java-debug-adapter", "*.jar", true, true);
vim.list_extend(bundles, vim.split(vim.fn.glob("$MASON/share/java-test/*.jar", true), "\n"))

-- local java_test_bundles = vim.split(vim.fn.glob("$MASON/share/java-test/*.jar", true), "\n");
-- local excluded = {
--   "com.microsoft.java.test.runner-jar-with-dependencies.jar",
--   "jacocoagent.jar",
-- }
-- for _, java_test_jar in ipairs(java_test_bundles) do
--   local fname = vim.fn.fnamemodify(java_test_jar, ":t")
--   if not vim.tbl_contains(excluded, fname) then
--     table.insert(bundles, java_test_jar)
--   end
-- end


local extendedClientCapabilities = require 'jdtls'.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
-- extendedClientCapabilities.progressReportProvider = true

local jdtls_path = vim.fn.expand("$MASON/packages/jdtls")
-- vim.list_extend(bundles, require("spring_boot").java_extensions())

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
        -- '-Xms1g',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:' .. jdtls_path .. '/lombok.jar',
        '-jar', vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
        '-configuration', home .. '/.local/share/nvim/mason/packages/jdtls/config_' .. system,
        '-data', workspace_dir,
    },
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),

    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = root_dir,

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {
            inlayHints = {
                parameterNames = {
                    enabled = "all",
                    exclusions = { "this" },
                },
            },
            format = {
                enabled = true,
                settings = {
                    url = vim.fn.getcwd() .. '/.settings/formatter.xml',
                    -- url = root_dir .. '/../.settings/formatter.xml',
                    profile = "GoogleStyle",
                },
            },
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-1.8",
                        path = os.getenv("JDK8"),
                    },
                    {
                        name = "JavaSE-17",
                        path = os.getenv("JDK17"),
                        default = true,
                    },
                    {
                        name = "JavaSE-21",
                        path = os.getenv("JDK21"),
                    },
                },
                maven = {
                    globalSettings = os.getenv("MAVEN_HOME") .. "/conf/settings.xml",
                    userSettings = os.getenv("HOME") .. "/.m2/settings.xml",
                }
            },
            -- saveActions = {
            --     organizeImports = true,
            -- },
            maven = {
                downloadSources = true,
            },
            eclipse = {
                downloadSources = true,
            },
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
        extendedClientCapabilities = extendedClientCapabilities
    },
}
