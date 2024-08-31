# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

source $HOME/antigen.zsh

antigen bundle git
antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle npm
antigen bundle lukechilds/zsh-nvm
antigen bundle autojump-zsh
antigen bundle agkozak/zsh-z
# syntax
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
#apply
antigen apply

# Aliases import
source $HOME/.aliases


# Nvm use current specified nvm version
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

function chpwd {
  set_nvm_version
}
function set_nvm_version {
  CWD=$(pwd)
  NVM_FILE="$CWD/.nvmrc"
  if [ -e "$NVM_FILE" ]; then
    NODE_VERSION=$(cat $NVM_FILE)
    eval "nvm use $NODE_VERSION"
    EXIT_CODE=$?
    if [ $EXIT_CODE -eq 3 ]; then
      eval "nvm install $NODE_VERSION"
    fi
  fi
}
set_nvm_version
# end of NVM fn

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export DOCKER_HOST="unix://$HOME/.colima/docker.sock"
fpath=(~/.docker/completions \/Users/izalar/.oh-my-zsh/plugins/git /Users/izalar/.oh-my-zsh/functions /Users/izalar/.oh-my-zsh/completions /Users/izalar/.oh-my-zsh/custom/functions /Users/izalar/.oh-my-zsh/custom/completions /Users/izalar/.oh-my-zsh/plugins/git /Users/izalar/.oh-my-zsh/functions /Users/izalar/.oh-my-zsh/completions /Users/izalar/.oh-my-zsh/custom/functions /Users/izalar/.oh-my-zsh/custom/completions /Users/izalar/.oh-my-zsh/cache/completions /usr/local/share/zsh/site-functions /usr/share/zsh/site-functions /usr/share/zsh/5.9/functions)
autoload -Uz compinit
compinit


export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH

# bun completions
[ -s "/Users/izalar/.bun/_bun" ] && source "/Users/izalar/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# https://starship.rs/ prompt theme
eval "$(starship init zsh)"