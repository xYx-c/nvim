-- https://github.com/nvim-telescope/telescope.nvim
-- WARN: telescope 手动安装依赖 fd 和 repgrep
-- https://github.com/sharkdp/fd
-- Debian
-- sudo apt-get install fd-find

-- macOS
-- brew install fd
-- https://github.com/BurntSushi/ripgrep

local telescopeConfig = require("telescope.config")
-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/node_modules/*")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.jdtls_data/*")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.svn/*")

local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
    opts = opts or {}
    Job:new({
        command = "file",
        args = { "--mime-type", "-b", filepath },
        on_exit = function(j)
            local mime_type = vim.split(j:result()[1], "/")[1]
            if mime_type == "text" then
                previewers.buffer_previewer_maker(filepath, bufnr, opts)
            else
                vim.schedule(function()
                    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
                end)
            end
        end
    }):sync()

    filepath = vim.fn.expand(filepath)
    vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then return end
        if stat.size > 1000 then
            return
        else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
    end)
end

local telescope = require('telescope')
telescope.load_extension("dap")
telescope.setup({
    pickers = {
        find_files = {
            theme = "dropdown",
            -- find_command = { "rg", "--files", "--hidden", "--glob", "!*/.git/*", "!*/node_modules/*", "!*/.jdtls_data/*", "!*/.svn/*" },
        }
    },
    defaults = {
        vimgrep_arguments = vimgrep_arguments,
        buffer_previewer_maker = new_maker,
    },
    preview = {
        mime_hook = function(filepath, bufnr, opts)
            local is_image = function(filepath)
                local image_extensions = { 'png', 'jpg' } -- Supported image formats
                local split_path = vim.split(filepath:lower(), '.', { plain = true })
                local extension = split_path[#split_path]
                return vim.tbl_contains(image_extensions, extension)
            end
            if is_image(filepath) then
                local term = vim.api.nvim_open_term(bufnr, {})
                local function send_output(_, data, _)
                    for _, d in ipairs(data) do
                        vim.api.nvim_chan_send(term, d .. '\r\n')
                    end
                end

                vim.fn.jobstart(
                    {
                        'catimg', filepath -- Terminal image viewer command
                    },
                    { on_stdout = send_output, stdout_buffered = true })
            else
                require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
            end
        end
    },
})
