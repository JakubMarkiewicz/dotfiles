# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="kennethreitz"

# just remind me to update when it's time

zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 1


# plugins 
plugins=(
  git-auto-fetch
  git
  zsh-autosuggestions
  yarn
)

# omz
source $ZSH/oh-my-zsh.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=~/.yarn/bin:$PATH

# Golang path
export GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"

# Aliases
alias vim="nvim"
alias vi="nvim"

alias __dots="cd ~/Projects/Personal/dots/; vim"
alias __weather="curl wttr.in"

# bun completions
[ -s "/Users/jakubmarkiewicz/.bun/_bun" ] && source "/Users/jakubmarkiewicz/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="$(brew --prefix)/opt/curl/bin:$PATH"
export PATH=$HOME/Projects/flutter/bin:$PATH
export HOMEBREW_GITHUB_API_TOKEN=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

# pnpm
export PNPM_HOME="/Users/jakubmarkiewicz/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

export PATH=".cargo/bin:$PATH"

# enable fzf on [command] ** OR [command] CTRL+T
eval "$(fzf --zsh)"

eval "$(pyenv init --path)"
