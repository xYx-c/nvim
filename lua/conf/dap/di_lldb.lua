local opts = {
    init = function(dap_install)
        dap_install.config("codelldb", {})
    end
}
return opts
