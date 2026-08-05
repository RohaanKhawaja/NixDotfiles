# Rohaan's Nix Config - Networking Settings

{config, pkgs, ...}:

{
  # Define host name (based on variable in configuration.nix)
  networking.hostName = config.myConfig.hostname;

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Bluetooth networking
  networking.networkmanager.wifi.backend = "wpa_supplicant";

  # Allow ports for KDE Connect
  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [{ from = 1714; to = 1764; }];
    allowedUDPPortRanges = [{ from = 1714; to = 1764; }];
    allowedTCPPorts = [ 22000 53317 ];
    allowedUDPPorts = [ 22000 21027 53317 ];
  };
}
