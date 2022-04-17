return {
    adapters = function(callback, _) -- _ = config
    callback({
        type = 'server';
        host = '127.0.0.1';
        -- port = port;
        port = 5005;
    })
    end,
    configurations = {
        type = 'java';
        request = 'attach';
        name = "Debug (Attach) - Remote";
        hostName = "127.0.0.1";
        port = 5005;
    }
}
