if [[ -z "$_SOURCE_BREW_DONE" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export _SOURCE_BREW_DONE=1
fi
