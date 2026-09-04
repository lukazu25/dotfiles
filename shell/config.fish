# Custom greeting
set KERNEL (uname -r)
set fish_greeting (set_color --bold efcf40)">"(set_color ef9540)"<"(set_color ea3838)">" \
  (set_color normal)"fish $FISH_VERSION" \
  (set_color normal)"| $KERNEL"

# Prevents apps from closing when closing terminal
# Usage: stay <command>
function stay
  nohup $argv > /dev/null 2>&1 < /dev/null & disown
end

# History settings
set -U fish_history main
set -U fish_history_max 10000

# Colored less + termcap vars
set -gx LESS "-R"
set -gx LESS_TERMCAP_mb "\033[01;31m"
set -gx LESS_TERMCAP_md "\033[01;31m"
set -gx LESS_TERMCAP_me "\033[0m"
set -gx LESS_TERMCAP_se "\033[0m"
set -gx LESS_TERMCAP_so "\033[01;44;33m"
set -gx LESS_TERMCAP_ue "\033[0m"
set -gx LESS_TERMCAP_us "\033[01;32m"

# Colored man pages
set -gx MANROFFOPT -c
set -gx MANPAGER "less -R"

function fish_prompt
    set_color green
    printf '%s@%s ' (whoami) (prompt_hostname)
    set_color blue
    printf '%s' (prompt_pwd)
    set_color normal
    printf ' $ '
end


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

# yay alias for Arch linux
#alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"

# os age
#alias osage='echo $(( ( $(date +%s) - $(stat -c %W /) ) / 86400 )) days'
