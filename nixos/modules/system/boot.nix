# Rohaan's Nix Config - Boot Settings

{ config, pkgs, ... }:

{ 
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true; 
    efi.canTouchEfiVariables = true; 
  };

}
