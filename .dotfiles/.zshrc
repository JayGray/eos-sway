# Uncomment this line to profile startup time
# zmodload zsh/zprof
#
### ZSH SETTINGS ###
CONFIG=$HOME/.config
DOTFILES=$HOME/.dotfiles
ZSH=$DOTFILES/zsh
ZSH_PLUGINS=/usr/share/zsh/plugins

export BROWSER=/usr/bin/google-chrome-stable
export EDITOR=/usr/local/bin/nvim

# source all .zsh files inside of the zsh/ directory
for config ($ZSH/**/*.zsh) source $config

# initialize autocomplete
fpath=($ZSH/completions $fpath)
autoload -Uz compinit && compinit

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Customize to your needs...
PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/local/bin:$DOTFILES/bin

# FZF
export FZF_DEFAULT_COMMAND='ag --files --no-ignore-vcs --hidden --smart-case'
source <(fzf --zsh)

# strip duplicate entries in $PATH and export
export PATH=$(zsh -fc "typeset -TU P=$PATH p; echo \$P")

# Prompt
eval "$(starship init zsh)"

# Source ZSH plugins
source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
