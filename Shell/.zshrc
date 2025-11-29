# Exit if not running interactively
[[ $- != *i* ]] && return

zmodload zsh/complist           
autoload -U compinit && compinit
autoload -U colors && colors
# autoload -U tetris    # Optional: Zsh's hidden gem


# History settings
HISTSIZE=1000
SAVEHIST=2000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE


# set up XDG folders
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Enable recursive globbing with **
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

# Identify chroot environment
if [[ -z "${debian_chroot:-}" && -r /etc/debian_chroot ]]; then
  debian_chroot=$(< /etc/debian_chroot)
fi
if [[ -z "${debian_chroot:-}" && -r /etc/chroot-name ]]; then
  debian_chroot=$(< /etc/chroot-name)
fi

# Determine if terminal supports color
case "$TERM" in
  xterm-color|*-256color|screen*|tmux*|rxvt*) color_prompt=yes ;;
esac

# Optional: force color prompt
# force_color_prompt=yes

if [[ -n "$force_color_prompt" ]]; then
  if command -v tput >/dev/null && tput setaf 1 &>/dev/null; then
    color_prompt=yes
  else
    color_prompt=
  fi
fi

# Set the prompt
if [[ "$color_prompt" == yes ]]; then
  PROMPT='${debian_chroot:+($debian_chroot)}%F{green}%n@%m%f:%F{blue}%~%f %# '
else
  PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~ %# '
fi

# Set terminal window title
case "$TERM" in
  xterm*|rxvt*|tmux*|screen*)
    precmd() { print -Pn "\e]0;${debian_chroot:+($debian_chroot)}%n@%m: %~\a" }
    ;;
esac

# Enable color support for ls and common tools
if command -v dircolors >/dev/null 2>&1; then
  if [[ -r ~/.dircolors ]]; then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(dircolors -b)"
  fi
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Alias's for multiple directory listing commands
alias la='ls -Alh'                
alias ls='ls --color=always'      
alias lx='ls -lXBh'               
alias lk='ls -lSrh'               
alias lc='ls -ltcrh'              
alias lu='ls -lturh'              
alias lr='ls -lRh'                
alias lt='ls -ltrh'               
alias lm='ls -alh | more'         
alias lw='ls -xAh'                
alias ll='ls -Fls'                
alias labc='ls -lap'              
alias lf="ls -l | egrep -v '^d'"  
alias ldir="ls -l | egrep '^d'"   
alias lla='ls -Al'                
alias las='ls -A'                 
alias lls='ls -l'                 

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# ping alias
alias ping='ping -c 5'

# tree alias
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'

# yay alias for Arch Linux
#alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"

# os age
#alias osage='echo $(( ( $(date +%s) - $(stat -c %W /) ) / 86400 )) days'

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Load personal aliases
# [[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases


