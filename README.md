# nvim
My neovim config

### Debian/Ubuntu
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list

sudo apt install fd-find ripgrep tidy jq glow
sudo ln -s $(which fdfind) /usr/local/bin/fd

### macOS
brew install fd ripgrep tidy-html5 jq glow
