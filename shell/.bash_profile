# Source the bashrc file for aliases in tmux
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi


# Keep just the key add, but only if socket exists:
if [ -S "$SSH_AUTH_SOCK" ]; then
    ssh-add -l >/dev/null 2>&1 || ssh-add ~/.ssh/id_ed25519 2>/dev/null
fi
