local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

vim.cmd [[packadd packer.nvim]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    git = {
        clone_timeout = 180,
    }
}

return require('packer').startup({
    function(use)
        use 'wbthomason/packer.nvim'
        require('plugins.tools').setup(use)
        require('plugins.edit').setup(use)
        require('plugins.ui').setup(use)
        require('plugins.lsp').setup(use)
        if packer_bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        git = {
            clone_timeout = 180,
        },
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end
        },
        profile = {
            enable = true,
            threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
        },
    }
})
