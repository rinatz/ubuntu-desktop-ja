alias cp='cp -i'
alias ls='ls --color=auto --show-control-chars'
alias ll='ls -l'
alias mv='mv -i'
alias rm='rm -i'

if type -t __git_ps1 > /dev/null; then
    PS1='\[\e]0;\h:\w\a\]\[\e[0;32m\]\u\[\e[0m\]@\[\e[34;1m\]\h\[\e[0m\]:\[\e[0;33m\]\W$(__git_ps1)\[\e[0m\] \$ \[\e[0m\]'
else
    PS1='\[\e]0;\h:\w\a\]\[\e[0;32m\]\u\[\e[0m\]@\[\e[34;1m\]\h\[\e[0m\]:\[\e[0;33m\]\W\[\e[0m\] \$ \[\e[0m\]'
fi

if [[ -z "${USER}" && -n "${USERNAME}" ]]; then
    export USER="${USERNAME}"
fi
