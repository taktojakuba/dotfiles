zstyle :compinstall filename '/home/kuba/.zshrc'
autoload -Uz compinit
compinit -C
alias vim="nvim"
alias zed="zeditor"
alias tmux="tmux attach || tmux new"
alias rebuild="sudo nixos-rebuild switch --flake .#nixasus"
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
alias opencode="nix run nixpkgs#opencode --extra-experimental-features nix-command --extra-experimental-features flakes"
cs() { cd "$@" && ls; }
memof() {
  pid=$(pidof $1)
  grep '^Pss:' /proc/$pid/smaps_rollup | awk '{printf "%.2f MiB\n", $2/1024}'
}
alias cd="cs"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
setopt CORRECT
jf
if [ -e /home/kuba/.nix-profile/etc/profile.d/nix.sh ]; then . /home/kuba/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# opencode
export PATH=/home/kuba/.opencode/bin:$PATH

# user bins
export PATH="$HOME/.local/bin:$PATH"
