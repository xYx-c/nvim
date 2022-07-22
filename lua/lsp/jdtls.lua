local java = os.getenv("JDK_HOME")
local home = os.getenv("HOME")
local system = io.popen("uname -s"):read("*l")
if system == "Darwin" then
    system = "mac"
elseif system == "Linux" then
    system = "linux"
elseif system == "Linux" then
    system = "windows"
end
local workspace_dir = '.jdtls_data'

local on_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', vim.keybinds.opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', vim.keybinds.opts)
    buf_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<cr>', vim.keybinds.opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', vim.keybinds.opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', vim.keybinds.opts)
    -- buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', vim.keybinds.opts)
    -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', vim.keybinds.opts)
    -- buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', vim.keybinds.opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', vim.keybinds.opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>Lspsaga rename<cr>', vim.keybinds.opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>', vim.keybinds.opts)
    buf_set_keymap('v', '<leader>ca', ':<c-u>Lspsaga range_code_action<cr>', vim.keybinds.opts)
    buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references theme=dropdown<CR>', vim.keybinds.opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', vim.keybinds.opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', vim.keybinds.opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', vim.keybinds.opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', vim.keybinds.opts)
    -- Java specific
    buf_set_keymap("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", vim.keybinds.opts)
    buf_set_keymap("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", vim.keybinds.opts)
    buf_set_keymap("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", vim.keybinds.opts)
    buf_set_keymap("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", vim.keybinds.opts)
    buf_set_keymap("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", vim.keybinds.opts)
    buf_set_keymap("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", vim.keybinds.opts)

    buf_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", vim.keybinds.opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

    -- debug
    -- require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    require('jdtls').setup_dap()
    require('jdtls.dap').setup_dap_main_class_configs()
    require('jdtls.setup').add_commands()
end

local bundles = {
  vim.fn.glob(home .. "/.config/nvim/dap/java_debug/com.microsoft.java.debug.plugin-*.jar"),
};
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.config/nvim/dap/java_test/*.jar"), "\n"))

return {
    flags = {allow_incremental_sync = true},
    name = 'jdtls',
    filetypes = {'java'},
    cmd = {
        java .. '/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1G',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:' .. home .. '/.local/share/nvim/lsp_servers/jdtls/lombok.jar',
        -- '-Xbootclasspath/a:' .. home .. '/.local/share/nvim/lsp_servers/jdtls/lombok.jar',
        '-jar', home .. '/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
        '-configuration', home .. '/.local/share/nvim/lsp_servers/jdtls/config_' .. system,
        '-data', workspace_dir,
    },

    on_attach = on_attach,

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
                        path = os.getenv("JAVA_HOME")
                    },
                    -- {
                    --     name = "JavaSE-17",
                    --     path = os.getenv("JAVA_HOME")
                    -- },
                }
            }
        }
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        bundles = bundles;
    },
}
