if [[ -z "$_SOURCE_PATH_DONE" ]]; then
  export EDITOR=nvim

  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
  export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/30.0.3:$ANDROID_HOME/dex-tools"

  # sunday
  export SUNDAY_ROOT="$HOME/.sunday"
  export PATH="$HOME/.sunday/bin:$PATH"

  # Created by `pipx` on 2023-01-29 05:42:41
  export PATH="$PATH:$HOME/.local/bin"

  export PATH=$PATH:/usr/local/mysql/bin

  export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@15/lib/pkgconfig"
  export _SOURCE_PATH_DONE=1
fi
