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
set -U fish_history -1        # Set to 1000 history entries
set -U fish_history_size 2000
set -U fish_history_file "$HOME/.local/share/fish/fish_history"
set -g fish_historic_file_size 2000

# Set up XDG folders
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_CACHE_HOME "$HOME/.cache"

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
set -gx MANROFFOPT='-c'
set -gx MANPAGER "less -R"

# Determine if terminal supports color
switch $TERM
    case "xterm-color" "*-256color" "screen*" "tmux*" "rxvt*"
        set -gx color_prompt yes
end

# Set the prompt (no escape sequences in Fish)
if test $color_prompt = "yes"
    set -g fish_prompt (set -q debian_chroot; and echo '(' $debian_chroot ')') (set_color green) (whoami) "@" (hostname) (set_color normal) (set_color blue) (pwd) (set_color normal) " \$ "
else
    set -g fish_prompt (set -q debian_chroot; and echo '(' $debian_chroot ')') (whoami) "@" (hostname) ":" (pwd) " \$ "
end

# Enable color support for ls and common tools
if type -q dircolors
    if test -r ~/.dircolors
        dircolors -b ~/.dircolors | source
    else
        dircolors -b | source
    end
end

# Aliases for common commands
alias la="ls -Alh"            # show hidden files
alias ls="ls --color=always"  # add colors
alias lx="ls -lXBh"           # sort by extension
alias lk="ls -lSrh"           # sort by size
alias lc="ls -ltcrh"          # sort by change time
alias lu="ls -lturh"          # sort by access time
alias lr="ls -lRh"            # recursive ls
alias lt="ls -ltrh"           # sort by date
alias lm="ls -alh | more"     # pipe through 'more'
alias lw="ls -xAh"            # wide listing format
alias ll="ls -Fls"            # long listing format
alias labc="ls -lap"          # alphabetical sort
alias lf="ls -l | egrep -v '^d'"  # files only
alias ldir="ls -l | egrep '^d'"   # directories only
alias lla="ls -Al"            # List and Hidden Files
alias las="ls -A"             # Hidden Files
alias lls="ls -l"             # List

# Aliases for chmod commands
alias mx="chmod a+x"
alias 000="chmod -R 000"
alias 644="chmod -R 644"
alias 666="chmod -R 666"
alias 755="chmod -R 755"
alias 777="chmod -R 777"

# Ping alias
alias ping="ping -c 5"

# tree alias
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'

# tree alias
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'

# yay alias for Arch linux
#alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"

# os age
#alias osage='echo $(( ( $(date +%s) - $(stat -c %W /) ) / 86400 )) days'

# Alias for archives
alias mktar="tar -cvf"
alias mkbz2="tar -cvjf"
alias mkgz="tar -cvzf"
alias untar="tar -xvf"
alias unbz2="tar -xvjf"
alias ungz="tar -xvzf"
