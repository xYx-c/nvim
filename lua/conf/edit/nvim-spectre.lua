-- https://github.com/nvim-pack/nvim-spectre
-- WARN: spectre 手动安装依赖项 sed 和 ripgrep

-- sed 命令（自行安装，如果已有则忽略）
-- brew install gnu-sed

-- repgrep： https://github.com/BurntSushi/ripgrep
-- mac
-- brew install ripgrep
-- centOS
-- sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
-- sudo yum install ripgrep
-- debian
-- curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
-- sudo dpkg -i ripgrep_13.0.0_amd64.deb
require("spectre").setup({
})
