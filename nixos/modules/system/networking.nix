# Rohaan's Nix Config - Networking Settings

{config, pkgs, ...}:

{
  # Define host name (based on variable in configuration.nix)
  networking.hostName = config.myConfig.hostname;

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Bluetooth networking
  networking.networkmanager.wifi.backend = "wpa_supplicant";
}
