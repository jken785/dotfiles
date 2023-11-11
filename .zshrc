alias vi="nvim"
alias vim="nvim"

alias setsid="/opt/homebrew/opt/util-linux/bin/setsid"
alias android="setsid ~/Library/Android/sdk/emulator/emulator -avd Pixel_6_API_34 1>/dev/null 2>/dev/null"
alias delete_local_branches="git branch | grep -vE \"master|staging|develop\" | xargs git branch -D"

export PATH="$PATH:$HOME/Library/Android/sdk/tools"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config /opt/homebrew/opt/oh-my-posh/themes/tokyonight_storm.omp.json)"
fi

# Ctrl-P
fzf-open-file-or-dir() {
  local cmd="command rg . --files"
  local out=$(eval $cmd | fzf --exit-0)

  if [ -f "$out" ]; then
    vi "$out"
  fi
}
bindkey '^F' fzf-open-file-or-dir

## [Completion] 
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/jakekendrick/.dart-cli-completion/zsh-config.zsh ]] && . /Users/jakekendrick/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]
