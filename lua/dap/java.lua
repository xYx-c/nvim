return {
    -- adapters = function(callback)
    -- callback({
    --     type = 'server';
    --     host = '127.0.0.1';
    --     port = '5005';
    -- })
    -- end,
    configurations = {
        {
            type = 'java';
            request = 'attach';
            name = "Debug (Attach) - Remote";
            projectName = "osmp",
            port = 5005;
        }
    }
}
