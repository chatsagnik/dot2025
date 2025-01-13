#!/bin/zsh
## ZINIT setup (optional)
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
source "${HOME}/.config/zsh/aliases.sh"
# Two regular plugins loaded.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

## History management
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# History management useful with fzf

setopt SHARE_HISTORY # share history across multiple zsh sessions
setopt APPEND_HISTORY # append commands to history 
setopt INC_APPEND_HISTORY # append commands as they are typed not at shell exit
setopt HIST_IGNORE_DUPS # clean duplicates and blank lines from history file
setopt HIST_REDUCE_BLANKS
setopt AUTO_CD # no cd needed to change directory

# Using sudo !! reruns the prev command as sudo
# We want to verify the prev command before running it
setopt HIST_VERIFY

eval "$(starship init zsh)"
