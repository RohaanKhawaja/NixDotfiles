# Rohaan's Nix Config - System Services

{ config, ... }:

{

  # Enable syncthing as a service
  services.syncthing = {
    enable           = true;
    user             = config.myConfig.username;
    dataDir          = config.myConfig.homeDir;
    configDir        = "${config.myConfig.homeDir}/.config/syncthing";
    openDefaultPorts = true;
  };
}
