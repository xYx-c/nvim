-- https://github.com/norcalli/nvim-colorizer.lua

-- Attach to certain Filetypes, add special configuration for `html`
-- Use `background` for everything else.
require 'colorizer'.setup {
    'css';
    'less';
    'scss';
    'vue';
    'javascript';
    'javascriptreact';
    'typescript';
    'typescriptreact';
    html = {
        mode = 'foreground';
    }
}
