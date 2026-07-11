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

# Aliases for mounting/unmounting
alias usbMount='sudo mount /dev/sda1 /mnt/usb && echo USB MOUNTED!'
alias usbUnmount='sudo umount /dev/sda1 && echo USB UNMOUNTED!'

# Nix Related Aliases
alias nr='sudo nixos-rebuild switch'
alias nt='sudo nixos-rebuild test'
alias ns="nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history"
alias ni='nix-shell -p'

# Git Related Aliases
alias gs='git status'
alias gf='git fetch'
alias ga='git add -A'
alias gc='git commit -m'
alias gpr='git push -u origin main'

# Neovim Related Aliases
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

# Hypr Related Aliases
alias hr='hyprctl reload'

# FZF Colour Scheme
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# Enable zoxide (keep at bottom of config)
eval "$(zoxide init bash)"
