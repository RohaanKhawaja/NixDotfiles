# Rohaan's Nix Config - System Maintenance

{ config, pkgs, ... }:

{
  # Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # Automatic Updates
  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };

}
