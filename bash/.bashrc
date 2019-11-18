# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
source /etc/bash_completion
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
alias ionlogin='elinks https://mahe2.dvois.com/24online/webpages/client.jsp'
alias devlogin='ssh -i ~/.ssh/gcs_instance_ec2.pem ubuntu@ec2-13-235-49-114.ap-south-1.compute.amazonaws.com'

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export HADOOP_HOME=$HOME/hadoop-2.7.3
export HADOOP_CONF_DIR=$HOME/hadoop-2.7.3/etc/hadoop
export HADOOP_MAPRED_HOME=$HOME/hadoop-2.7.3
export HADOOP_COMMON_HOME=$HOME/hadoop-2.7.3
export HADOOP_HDFS_HOME=$HOME/hadoop-2.7.3
export YARN_HOME=$HOME/hadoop-2.7.3
export PATH=$PATH:$HOME/hadoop-2.7.3/bin
