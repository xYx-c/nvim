-- https://github.com/kyazdani42/nvim-tree.lua

require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  disable_netrw = false,
  hide_root_folder = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 30,
    height = 30,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = nil,
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      git = false,
      profile = false,
    },
  },
} -- END_DEFAULT_OPTS
-- require("nvim-tree").setup(
--     {
--         -- 自动关闭
--         auto_close = true,
--         -- 视图
--         view = {
--             -- 宽度
--             width = 30,
--             -- 高度
--             height = 30,
--             -- 隐藏顶部的根目录显示
--             hide_root_folder = false,
--             -- 自动调整大小
--             auto_resize = true
--         },
--         diagnostics = {
--             -- 是否启用文件诊断信息
--             enable = true,
--             icons = {
--                 hint = "",
--                 info = "",
--                 warning = "",
--                 error = ""
--             }
--         },
--         git = {
--             -- 是否启用 git 信息
--             enable = true,
--             ignore = true,
--             timeout = 500
--         }
--     }
-- )
-- -- 默认图标，可自行修改
-- vim.g.nvim_tree_icons = {
--     default = " ",
--     symlink = " ",
--     git = {
--         unstaged = "",
--         staged = "✓",
--         unmerged = "",
--         renamed = "➜",
--         untracked = "",
--         deleted = "",
--         ignored = ""
--     },
--     folder = {
--         -- arrow_open = "╰─▸",
--         -- arrow_closed = "├─▸",
--         arrow_open = "",
--         arrow_closed = "",
--         default = "",
--         open = "",
--         empty = "",
--         empty_open = "",
--         symlink = "",
--         symlink_open = ""
--     }
-- }
-- 目录后加上反斜杠 /
vim.g.nvim_tree_add_trailing = 1
-- 按 leader 1 打开文件树
vim.keybinds.gmap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", vim.keybinds.opts)
-- 按 leader fc 在文件树中找到当前以打开文件的位置
vim.keybinds.gmap("n", "<leader>fc", "<cmd>NvimTreeFindFile<CR>", vim.keybinds.opts)
-- 默认按键
-- o     ：打开目录或文件
-- a     ：新增目录或文件
-- r     ：重命名目录或文件
-- x     ：剪切目录或文件
-- c     ：复制目录或文件
-- d     ：删除目录或文件
-- y     ：复制目录或文件名称
-- Y     ：复制目录或文件相对路径
-- gy    ：复制目录或文件绝对路径
-- p     ：粘贴目录或文件
-- s     ：使用系统默认程序打开目录或文件
-- <Tab> ：将文件添加到缓冲区，但不移动光标
-- <C-v> ：垂直分屏打开文件
-- <C-x> ：水平分屏打开文件
-- <C-]> ：进入光标下的目录
-- <C-r> ：重命名目录或文件，删除已有目录名称
-- -     ：返回上层目录
-- I     ：切换隐藏文件/目录的可见性
-- H     ：切换点文件的可见性
-- R     ：刷新资源管理器
-- 另外，文件资源管理器操作和操作文档方式一致，可按 / ? 进行搜索
