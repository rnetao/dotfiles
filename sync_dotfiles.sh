#!/bin/bash

# 用户输入Git仓库URL
DOTFILES_REPO="<your-repository-url>"

# 设置 dotfiles 目录
DOTFILES_DIR="$HOME/dotfiles"

# 如果 dotfiles 目录不存在，提示用户进行设置
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Dotfiles directory not found! Please run setup_dotfiles.sh first."
  exit 1
fi

# 拉取最新更新
echo "Pulling the latest changes from dotfiles repository..."
cd "$DOTFILES_DIR" && git pull

# 创建符号链接
echo "Re-creating symbolic links for dotfiles..."

ln -sf "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"

# 重新加载 zsh 配置
echo "Reloading zsh configuration..."
source "$HOME/.zshrc"

echo "Dotfiles sync completed!"

