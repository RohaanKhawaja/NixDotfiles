# Rohaan's NixOS Config - Dank Material Shell specific settings

{ config, pkgs, ...}:

let
  unstable = import (builtins.fetchTarball {
    url    = "https://github.com/NixOS/nixpkgs/archive/e8be7818e19ada32105a8af937a6a473b38167ca.tar.gz";
    sha256 = "06sil8mb0psrx1x49yfrxxr7sd6fqjz77amyx7bhr7rp3216gpyh";
  }) { config = config.nixpkgs.config; };
in

{
  # Enable DMS and modules
  programs.dms-shell = {
    enable = true;
    package = unstable.dms-shell;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    # Core features
    enableSystemMonitoring = true; 	# System monitoring widgets
    enableVPN = true; 			# VPN management widget
    enableDynamicTheming = true;	# Wallpaper-based theming
    enableAudioWavelength = true; 	# Audio visualiser (cava)
    enableCalendarEvents = true; 	# Calender integration (khal)
    enableClipboardPaste = true; 	# Clipboard history pasting (wtype)
  };

  # Enable DankSearch
  programs.dsearch.enable = true;

  # Enable Dank Greeter
  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = config.myConfig.desktop;
    configHome = config.myConfig.homeDir;
    configFiles = [
      "${config.myConfig.homeDir}/.config/DankMaterialShell/settings.json"
      "${config.myConfig.homeDir}/.local/state/DankMaterialShell/session.json"
    ];
  };


  # DMS preferred battery device
  environment.sessionVariables = {
    DMS_PREFERRED_BATTERY = "/org/freedesktop/UPower/devices/battery_BAT1";
  };

}
