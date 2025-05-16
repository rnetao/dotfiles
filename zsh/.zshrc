export ZSH="$DOTFILES_PATH/subgit/oh-my-zsh"

# 主题
ZSH_THEME="aussiegeek"

# 历史记录时间戳格式
HIST_STAMPS="yyyy-mm-dd"

# 启用插件
plugins=(
  sudo # 按两下esc键，上一条命令前面加sudo
  web-search # 命令前面加google，直接打开浏览器搜索
  copypath # 复制当前文件目录的绝对路径
  copyfile # 复制文件的内容
  copybuffer # 提供ctrl-o快捷键，复制当前命令行输入中的文本
  dirhistory # 提供快捷键用于快速选择目录，Alt + Up进入父目录，Alt + Down进入子目录，Alt + left进入上一历史目录，Alt + right进入下一级历史目录，dirs -v显示目录堆栈
  history # 提供命令行命令操作历史命令，h同history，hl同history | less，hs同history | grep，hsi同history | grep -i
  jsontools # 提供管道命令操作json，pp_json格式化打印json，is_json返回是否json的布尔值，urlencode_json将json生成url 编码字符串，urldecode_json将url编码转换成json
  macos # mac系统工具
  z # 模糊匹配目录并跳转
  colorize # 是cat和less命令显示文本有色彩，提供命令ccat和cless, 依赖Pygments可用brew安装
  vi-mode # vi模式插件
  colored-man-pages # man命令颜色显示
  # command-not-found # 命令没找到提示可用的相似命令
  gitignore # 自动生成.gitignore文件，gl list查看所有支持的语言
  emoji # 显示表情，display_emoji左右表情，random_emoji随机表情
  themes # omz主题，lstheme显示左右主题，theme随机跟换主题
  aliases # 显示别名，als显示左右别名，als --groups显示组名，als -g <group>显示指定组名下的别名
  git
  node
  npm
  nvm
  vscode
  yarn
  python
  pip
  tmux
  brew
)

# 编码方式
export LANG=en_US.UTF-8

# COMPDUMP的缓存文件
export ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump.cache"

# 加载模块化配置
for config_file in $ZDOTDIR/*.zsh; do
    [ -r "$config_file" ] && source "$config_file"
done

# 初始化
source $ZSH/oh-my-zsh.sh

# 手动启用zsh插件
source $DOTFILES_PATH/subgit/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"
