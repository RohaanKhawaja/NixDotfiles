# Rohaan's Nix Config - Input Settings

{ config, pkgs, ... }:

{
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable Kanata for more advanced keyboard remapping
  environment.systemPackages = [ pkgs.kanata ];

  systemd.services.kanata = {
    description = "Kanata keyboard remapper";
    after = [ "graphical.target" ];
    serviceConfig = {
      ExecStart = "/run/current-system/sw/bin/kanata --cfg ${config.myConfig.homeDir}/.config/kanata/kanata.kbd";
      Type = "simple";
      Restart = "no";
    };
    wantedBy = [ "graphical.target" ];
  };
}
