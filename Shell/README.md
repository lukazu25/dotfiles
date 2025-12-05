## Terminal Prompts

Default 

for bash
```
PS1='[\[\033[1;96m\]\w\[\033[0m\]] \[\033[90m\]>>\[\033[0m\] '
PS1='[\[\033[1;91m\]\w\[\033[0m\]] \[\033[90m\]>>\[\033[0m\] '
```
for zsh

```
PROMPT='[%B%F{cyan}%~%f%b] %F{black}>>%f '
PROMPT='[%B%F{red}%~%f%b] %F{black}>>%f '
```

Style 1

for bash
```
PS1='\[\e[38;5;240m\]╭──(\[\e[38;5;208m\]\u\[\e[38;5;240m\])-\[\e[38;5;45m\][\w]\[\e[0m\]\n\[\e[38;5;240m\]╰─\[\e[38;5;37m\]❯ \[\e[0m\]'
PS1='\[\e[38;5;240m\]╭──(\[\e[38;5;196m\]\u\[\e[38;5;240m\])-\[\e[38;5;45m\][\w]\[\e[0m\]\n\[\e[38;5;240m\]╰─\[\e[38;5;37m\]❯ \[\e[0m\]'
```
for zsh
```
PROMPT='%F{240}╭──(%F{208}%n%F{240})-%F{45}[%~]%f
%F{240}╰─%F{37}❯ %f'
PROMPT='%F{240}╭──(%F{196}%n%F{240})-%F{45}[%~]%f
%F{240}╰─%F{37}❯ %f'
```

Style 2

for bash
```
PS1='\[\033[01;32m\]┌──(\u)\[\e[0m\]-\[\033[01;34m\][\w]\[\e[0m\]\n\[\033[01;32m\]└─╼ \[\e[0m\]'
PS1='\[\e[38;5;196m\]┌──(\u)\[\e[0m\]-\[\033[01;34m\][\w]\[\e[0m\]\n\[\e[38;5;196m\]└─╼ \[\e[0m\]'
```
for zsh
```
PROMPT='%F{green}┌──(%n)%f-%F{blue}[%~]%f
%F{green}└─╼ %f'
PROMPT='%F{196}┌──(%n)%f-%F{blue}[%~]%f
%F{196}└─╼ %f'
```

### If you use starship 

```
sudo cp starship.toml ~/.config
```

### If you want to show asterisks on password

Create the file `/etc/sudoers.d/0pwfeedback` and add this line 

```
Defaults pwfeedback
```
### To disable 

```
Defaults !pwfeedback
```
Or 
```
sudo rm /etc/sudoers.d/0pwfeedback
```

### Colorschemes for fzf 

For fish terminal use `set -Ux FZF_DEFAULT_OPTS` instead of `export FZF_DEFAULT_OPTS=`

[Galaxy]

```
export FZF_DEFAULT_OPTS="
  --color=fg:#e3e3ea,bg:#08052b,hl:#ff7f7f
  --color=fg+:#e3e3ea,bg+:#08052b,hl+:#ff7f7f
  --color=info:#ff7f7f,prompt:#ff7f7f,pointer:#ff7f7f
  --color=marker:#ff7f7f,spinner:#ff7f7f,header:#ff7f7f"
```

[Solarized Dark]

```
export FZF_DEFAULT_OPTS="
  --color=fg:#839496,bg:#002b36,hl:#268bd2
  --color=fg+:#eee8d5,bg+:#073642,hl+:#268bd2
  --color=info:#b58900,prompt:#b58900,pointer:#2aa198
  --color=marker:#2aa198,spinner:#2aa198,header:#268bd2"
```

[Nord]

```
export FZF_DEFAULT_OPTS="
  --color=fg:#d8dee9,bg:#2e3440,hl:#81a1c1
  --color=fg+:#eceff4,bg+:#3b4252,hl+:#81a1c1
  --color=info:#ebcb8b,prompt:#ebcb8b,pointer:#88c0d0
  --color=marker:#88c0d0,spinner:#88c0d0,header:#81a1c1"
```

[Gruvbox]

```
export FZF_DEFAULT_OPTS="
  --color=fg:#ebdbb2,bg:#282828,hl:#fb4934
  --color=fg+:#ebdbb2,bg+:#3c3836,hl+:#fb4934
  --color=info:#83a598,prompt:#b8bb26,pointer:#fe8019
  --color=marker:#fabd2f,spinner:#d3869b,header:#928374"
```

[Everforest]

```
export FZF_DEFAULT_OPTS="
  --color=fg:#D3C6AA,bg:#2B3339,hl:#DBBC7F
  --color=fg+:#D3C6AA,bg+:#2B3339,hl+:#DBBC7F
  --color=info:#7FBBB3,prompt:#D699B6,pointer:#D3C6AA
  --color=marker:#83C092,spinner:#A7C080,header:#A7C080"
```




