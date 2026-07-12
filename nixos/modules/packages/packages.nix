# Rohaan's Nix Config - Packages

{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flatpaks
  services.flatpak.enable = true;

  imports =
    [
      ./terminal.nix          # Terminal Apps/Tools
      ./dev.nix               # Compilers & Debuggers
      ./system.nix            # Daemons & Utilities
      ./gaming.nix            # Steam, Launchers & Emulators
      ./fonts.nix             # Font Packages
      ./desktop.nix           # Universal Desktop Applications
    ];

}


