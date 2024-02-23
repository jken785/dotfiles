alias vi="/Applications/Neovide.app/Contents/MacOS/neovide"
# alias vi="nvim"
# alias vim="nvim"

alias setsid="/opt/homebrew/opt/util-linux/bin/setsid"
alias android="setsid ~/Library/Android/sdk/emulator/emulator -avd Pixel_6_API_34 1>/dev/null 2>/dev/null"
alias delete_local_branches="git branch | grep -vE \"master|staging|develop\" | xargs git branch -D"

addToPath() {
  if [[ "$PATH" != *"$1"* ]]; then
      export PATH=$PATH:$1
  fi
}

addToPathFront() {
  if [[ "$PATH" != *"$1"* ]]; then
      export PATH=$1:$PATH
  fi
}

addToPath $HOME/.config/scripts
addToPath $HOME/.pub-cache/bin
addToPath $HOME/Library/Android/sdk/tools
addToPath $HOME/Library/Android/sdk/platform-tools

addToPathFront /opt/homebrew/opt/ruby/bin

bindkey -s ^f "source fuzzy_cd\n"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/tonybaloney.omp.json)"
fi

# Completion
[[ -f ~/.dart-cli-completion/zsh-config.zsh ]] && . ~/.dart-cli-completion/zsh-config.zsh || true