export ZSH="$HOME/.config/oh-my-zsh"

# 主题
ZSH_THEME="aussiegeek"

# 历史记录时间戳格式
HIST_STAMPS="yyyy-mm-dd"

# 启用插件
plugins=(
  git
  vi-mode
  autojump
  gitignore
  history
  node
  npm
  nvm
  vscode
  yarn
  # zsh-autosuggestions
  python
  iterm2
)

# 编码方式
export LANG=en_US.UTF-8

# COMPDUMP的缓存文件
export ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump.cache"

# 初始化
source $ZSH/oh-my-zsh.sh

# 加载模块化配置
for config_file in $ZDOTDIR/*.zsh; do
    [ -r "$config_file" ] && source "$config_file"
done
