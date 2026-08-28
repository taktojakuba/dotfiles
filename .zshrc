zstyle :compinstall filename '/home/kuba/.zshrc'
autoload -Uz compinit
compinit -C
alias vim="nvim"
alias zed="zeditor"
alias tmux="tmux attach || tmux new"
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
alias gpp="g++"
alias ls="ls -ah --color=always --group-directories-first"
cs() { cd "$@" && ls; }
memof() {
  pid=$(pidof $1)
  grep '^Pss:' /proc/$pid/smaps_rollup | awk '{printf "%.2f MiB\n", $2/1024}'
}
memf() {
  echo "47.52MiB"
}
alias cd="cs"
export PATH=$PATH:/home/kuba/.spicetify
export PATH=~/.npm-global/bin:$PATH
export PATH=$PATH:~/.spicetify
eval "$(starship init zsh)"
setopt CORRECT
jf ~/JustFetch/art.csv
# Created by `pipx` on 2026-07-15 17:00:24
export PATH="$PATH:/home/kuba/.local/bin"
# Added by Antigravity CLI installer
export PATH="/home/kuba/.local/bin:$PATH"
# opencode
alias opencode="~/.opencode/bin/opencode"
export PATH=/home/kuba/.opencode/bin:$PATH
