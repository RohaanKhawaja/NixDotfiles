# Enable starship
eval "$(starship init bash)"

# Enable fzf
eval "$(fzf --bash)"

# Set default editor to nvim
export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR="nvim"

# General terminal aliases
alias cls='clear'
alias f='z'
alias fp='z ..'
alias fb='z -'
alias ff='fastfetch'
alias bs='source ~/.bashrc'
alias history='bat ~/.bash_history | rg'
alias copyPath='pwd | wl-copy'
alias treeCopy='tree | wl-copy'
alias battery='echo "$(cat /sys/class/power_supply/BAT1/capacity)% - $(cat /sys/class/power_supply/BAT1/status)"'

# Task Warrior Aliases
tl() { task list project:"$1"; }
alias tla='task list'

# Aliases for mounting/unmounting
alias usbMount='sudo mount /dev/sda1 /mnt/usb && echo USB MOUNTED!'
alias usbUnmount='sudo umount /dev/sda1 && echo USB UNMOUNTED!'
alias androidMount='jmtpfs /mnt/phone'
alias androidUnmount='sudo fusermount -uz /mnt/phone'

# Nix Related Aliases
alias nr='sudo nixos-rebuild switch'
alias nt='sudo nixos-rebuild test'
alias nu='sudo nix-channel --update'
alias ns="nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history"
alias ni='nix-shell -p'
alias ng='sudo nix-env --list-generations --profile /nix/var/nix/profiles/system'

# Git Related Aliases
alias gs='git status'
alias gf='git fetch'
alias ga='git add -A'
alias gc='git commit -m'
alias gm='git merge origin main'
alias gp='git pull'
alias gpr='git push -u origin main'

# Neovim Related Aliases/Functions
alias v='nvim .'
# Greps file names in directory before oepning in nvim
function vf() {
  local file
  file=$(find "${1:-.}" -type f | fzf --preview 'bat --color=always {}')
  [ -n "$file" ] && nvim "$file"
}
# Search file contents and open at the matching line
function vg() {
  local result
  result=$(rg --line-number --color=always "${1:-.}" | fzf --ansi --delimiter=: --preview 'bat --color=always --highlight-line {2} {1}' --preview-window 'right:60%:+{2}')
  [ -n "$result" ] && nvim "$(echo "$result" | cut -d: -f1)" +"$(echo "$result" | cut -d: -f2)"
}

# FZF Colour Scheme
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# Enable zoxide (keep at bottom of config)
eval "$(zoxide init bash)"
