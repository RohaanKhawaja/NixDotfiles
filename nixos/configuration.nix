# Rohaan's Nix Config - Master Configuration file
{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix

      # User's Config
      ./modules/user.nix

      # Core System Options
      ./modules/system/locale.nix
      ./modules/system/options.nix
      ./modules/system/boot.nix
      ./modules/system/input.nix
      ./modules/system/hardware.nix
      ./modules/system/networking.nix
      ./modules/system/maintenance.nix
      ./modules/system/audio.nix

      # Virtualisation
      ./modules/system/vm.nix

      # Laptop Specific Settings
      ./modules/system/acer.nix

      # Desktop Modules
      ./modules/desktop/niri.nix
      ./modules/desktop/dms.nix

      # Master File for all packages + options
      ./modules/packages/packages.nix
    ];

  # NixOS Release Version
  system.stateVersion = "25.11";

  # Enable experimental Nix features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set User attributes
  myConfig = {
    username = "rohaan";
    hostname = "nixos";
    homeDir = "/home/rohaan";
    desktop = "niri"; # Set to appropriate desktop
  };

  # Session variable for active desktop type
  environment.sessionVariables = {
    MY_DESKTOP = config.myConfig.desktop;
  };
}
