# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#source /etc/bash_completion
alias ls='ls --color=auto -CF --group-directories-first'
export PS1=" \[\e[00;34m\]$ \W \[\e[0m\]"
alias e=$EDITOR
alias se='sudoedit'
alias sl='ls'

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
function ws()
{
    fil="$1 ->"
    command ls -al /usr/bin | grep "$fil"
}
alias ..='cd ..'
alias ...='cd ../..'
alias ionlogin='lynx https://mahe2.dvois.com/24online/webpages/client.jsp'
