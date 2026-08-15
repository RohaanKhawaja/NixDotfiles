# Rohaan's NixOS Config - Niri Desktop Configuration

{ config, pkgs, ... }:

{
  # Enable Niri
  programs.niri.enable = true;

  # Enable XWayland support
  programs.xwayland.enable = true;

  # To allow for KDE connect to work
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };

  # Systemd start process
  systemd.user.extraConfig = ''
    DefaultEnvironment="WAYLAND_DISPLAY=%E" "XDG_CURRENT_DESKTOP=niri"
  '';

  # Desktop Specific packages
  environment.systemPackages = with pkgs; [
    rose-pine-cursor 	      # Cursor Theme
    hypridle 		            # Idle Daemon
    cliphist 		            # Clipboard history backend
    grim 		                # Screenshot tool
    slurp 		              # Screen area selection
    swaybg 		              # Wallpaper Utility
    mpvpaper		            # Live Wallpaper Utility
    brightnessctl 	        # Brightness control
    playerctl		            # Media controls
    xwayland-satellite      # XWayland tool
  ];
}
