{ config, pkgs, pkgs-2505, nixCats, ... }:

{
  imports = [
    ./hardware.nix

    # System
    ../../nixos/modules/system/options.nix
    ../../nixos/modules/system/boot.nix
    ../../nixos/modules/system/hardware.nix
    ../../nixos/modules/system/input.nix
    ../../nixos/modules/system/locale.nix
    ../../nixos/modules/system/networking.nix
    ../../nixos/modules/system/audio.nix
    ../../nixos/modules/system/maintenance.nix
    ../../nixos/modules/system/nixld.nix
    ../../nixos/modules/system/scripts.nix
    ../../nixos/modules/system/vm.nix
    ../../nixos/modules/system/acer.nix

    # Desktop
    ../../nixos/modules/desktop/niri.nix
    ../../nixos/modules/desktop/dms.nix
    ../../nixos/modules/desktop/theming.nix

    # Packages
    ../../nixos/modules/packages/packages.nix

    # User
    ../../nixos/modules/user.nix
  ];

  myConfig = {
    username  = "rohaan";
    hostname  = "swift";
    homeDir   = "/home/rohaan";
    configDir = "/home/rohaan/dotfiles";
    desktop   = "niri";
  };

  environment.sessionVariables = {
    MY_DESKTOP = config.myConfig.desktop;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
