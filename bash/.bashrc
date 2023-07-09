# .bashrc

# If not running interactively, don't do anything
alias ls='/bin/ls --color=auto -CF --group-directories-first'
export PS1=" \[\e[00;34m\]$ \W \[\e[0m\]"
alias e=editor
alias se='sudoedit'
alias sl='ls'
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
if [ $TERM = "st-256color" ]; then
    xseticon -id $WINDOWID ~/Downloads/App-Terminal-icon.png
fi
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=" -R "
alias ..='cd ..'
alias ...='cd ../..'
