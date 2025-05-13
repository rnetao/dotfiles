if [[ -z "$_SOURCE_NODE_DONE" ]]; then
  NODE_MODULES=$HOME/.npm
  NPM_PACKAGES=$HOME/.npm-packages/bin
  # export NODE_PATH=`npm root -g`
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  export PATH=$PATH:$NODE_MODULES:$NPM_PACKAGES
  export _SOURCE_NODE_DONE=1
fi
