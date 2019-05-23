eval "$(chef shell-init bash)"
#export PS1="\h \W $ "

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\e[0;36m\h\e[m:\e[0;32m\W\e[m\e[0;31m\$(parse_git_branch)\e[m\\$ "

source /Users/dewet/.projectrc # SalesLoft Unbocksen setup.sh
