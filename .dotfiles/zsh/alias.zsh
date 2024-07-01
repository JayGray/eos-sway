#reload zsh config
alias reload!='source $HOME/.zshrc'

alias vim=nvim

### GIT and HUB###
alias gco="git checkout"
alias gs="git status"
alias gup="git pull --rebase"
alias glog="git log --oneline --decorate --graph"
alias gprune="git remote prune origin && git branch -vv | grep ': gone]' | awk '{print $1}' | xargs git branch -D"
alias pr-ui='gh pr create -fa JayGray'
alias pr-draft='gh pr create -dfa JayGray'

### ls ###
alias l="ls -lah -G --color=auto"
alias la="ls -AF -G --color=auto"
alias ll="ls -lFh -G --color=auto"
alias lld="ls -ld */ --color=auto"

alias wetter="curl wttr.in/halle\(saale\)"

