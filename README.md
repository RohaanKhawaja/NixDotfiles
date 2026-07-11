# Rohaan's Dotfile Setup for NixOS (and other distros)

Designed to be portable between different operating systems but primarily for use with NixOS

## Step by step setup guide

1. Install NixOS with no desktop environment and connect to the internet.
2. Temporarily install git, and stow:
```
nix-shell -p git stow neovim
```
3. Clone the repo:
```
git clone https://github.com/RohaanKhawaja/NixOS-Dotfiles ~/dotfiles
```
4. Modify the `user.nix` file to contain your username.
```
nvim ~/dotfiles/nixos/modules/user.nix
```
5. Open `configuration.nix` and comment out all desktop modules other than the one you wish to use.
```
nvim ~/dotfiles/nixos/configuration.nix
```
6. Modify the user attributes in `configuration.nix` to match your user name, home directory, and desktop choice.
7. Delete the default `configuration.nix` file at `/etc/nixos` using:
```
sudo rm configuration.nix
```
8. Return to `~/dotfiles` and run the following command:
```
sudo stow -t /etc/nixos nixos
```
9. Rebuild the system using `sudo nixos-rebuild switch` and reboot!
10. Return to `~/dotfiles` and use the `stow` command to stow the rest of the dotfiles (excluding the nixos directory). To use stow it is simply:
```
stow directory1 directory2 ...
```
11. Clone the Tmux plugin manager:
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
and then install it using `<CTRL+S> + I`

