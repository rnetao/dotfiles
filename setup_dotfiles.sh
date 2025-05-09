#!/bin/bash

# 用户输入Git仓库URL
DOTFILES_REPO="<your-repository-url>"

# 设置 dotfiles 目录
DOTFILES_DIR="$HOME/dotfiles"

# 克隆 dotfiles 仓库
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Cloning dotfiles repository..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
  echo "Dotfiles repository already exists. Pulling latest changes..."
  cd "$DOTFILES_DIR" && git pull
fi

# 创建符号链接
echo "Creating symbolic links for dotfiles..."

ln -sf "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"

# 如果你使用了 Oh My Zsh, 安装它（可选）
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh is already installed."
fi

# 如果有其他插件或依赖需要安装，添加在这里
echo "Setting up plugins and dependencies..."

# 安装 zsh 插件（如 zsh-autosuggestions、zsh-syntax-highlighting）
if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ]; then
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/zsh-autosuggestions"
fi

if [ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ]; then
  echo "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.zsh/zsh-syntax-highlighting"
fi

# 安装 tmux 插件（如 tpm）
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing tmux plugin manager (TPM)..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# 重新加载 zsh 配置
echo "Reloading zsh configuration..."
source "$HOME/.zshrc"

echo "Setup completed!"

