# Exit if not running interactively
[[ $- != *i* ]] && return

zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
# autoload -U tetris


# History settings
HISTSIZE=1000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt GLOB_STAR_SHORT

# Colored less + termcap vars
export LESS="-R"
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

# Colored man pages
export MANROFFOPT='-c'
export MANPAGER="less -R"

PROMPT='%F{green}%n@%m%f:%F{blue}%~%f %# '

# Alias's for multiple directory listing commands
alias la='ls -Alh'
alias ls='ls --color=always'
alias lx='ls -lXBh'
alias lk='ls -lSrh'
alias lc='ls -ltcrh'
alias lu='ls -lturh'
alias lr='ls -lRh'
alias lt='ls -ltrh'
alias lm='ls -alh |more'
alias lw='ls -xAh'
alias ll='ls -Fls'
alias labc='ls -lap'
alias lf="ls -l | egrep -v '^d'"
alias ldir="ls -l | egrep '^d'"
alias lla='ls -Al'
alias las='ls -A'
alias lls='ls -l'             

# manage systemd services
#fserv() {
#    local service
#    service=$(systemctl list-units --type=service --all | fzf --reverse --style full \
#        --header-lines 1 \
#        --bind 'load:transform-footer:echo $FZF_TOTAL_COUNT services' \
#        --header-lines-border inline --footer-border inline | awk '{print $1}')
#
#    if [ -n "$service" ]; then
#        echo -n "Action for $service (start/stop/restart/enable/disable/status)? "
#        read -r action
#        sudo systemctl "$action" "$service"
#    fi
#}

# select a process and kill it
#fkill() {
#    local pid
#    pid=$(ps -ef | fzf --reverse --style full \
#        --header-lines 1 \
#        --bind 'load:transform-footer:echo $FZF_TOTAL_COUNT processes' \
#        --header-lines-border inline --footer-border inline | awk '{print $2}')
#
#    if [ -n "$pid" ]; then
#        echo "Killing PID: $pid"
#        kill -9 "$pid"
#    fi
#}

# install package on Debian/Ubuntu linux
#finst() {
#    local package
#    package=$(apt-cache search . | fzf --reverse --style full \
#        --preview 'apt-cache show {1}' \
#        --bind 'load:transform-footer:echo $FZF_TOTAL_COUNT packages available' \
#        --header-lines-border inline --footer-border inline | awk '{print $1}')
#
#    if [ -n "$package" ]; then
#        sudo apt install "$package"
#    fi
#}

# yay alias for Arch Linux
#alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"

# os age
#alias osage='echo $(( ( $(date +%s) - $(stat -c %W /) ) / 86400 )) days'

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
