zstyle :compinstall filename '/home/kuba/.zshrc'
autoload -Uz compinit
compinit
fastfetch
alias vim="nvim"
alias zed="zeditor"
alias yays="yay -S --needed --noconfirm"
alias yayu="yay -Syu --noconfirm"
alias yayr="yay -Rns --noconfirm"
alias pacs="sudo pacman -S --needed --noconfirm"
alias pacu="sudo pacman -Syu --noconfirm"
alias pacr="sudo pacman -Rns --noconfirm"
alias y="yazi"
alias ga="git add ."
alias gi="git init"
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"
alias gu="git pull"
alias mkdir="mkdir -p"
alias ls="ls -ah --color=always --group-directories-first"
cs() { cd "$@" && ls; }
alias cd="cs"
export PATH=$PATH:/home/kuba/.spicetify
export PATH=$PATH:~/.spicetify
eval "$(starship init zsh)"
setopt CORRECT

