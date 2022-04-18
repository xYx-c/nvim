-- local util = require('jdtls.util')
-- local projectName = os.getenv('PROJECT_NAME')

return {
    -- adapters = function(callback)
    --     util.execute_command({command = 'vscode.java.startDebugSession'}, function(err0, port)
    --       assert(not err0, vim.inspect(err0))
    --       callback({
    --             type = 'server';
    --             host = '127.0.0.1';
    --             port = port;
    --         })
    --     end)
    -- end,
    configurations = {
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote";
            -- projectName = projectName or nil,
            hostName = "127.0.0.1",
            port = 5005;
        }
    }
}
