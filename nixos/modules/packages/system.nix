# Rohaan's NixOS Config - System packages

{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    # System Utilities
    ntfs3g                    # NTFS Drive Utility
    brightnessctl             # Brightness Controls
    playerctl                 # Mutlimedia Controls
    pavucontrol               # Volume Control
    pulseaudioFull            # Audio Utils
    efibootmgr                # EFI Boot Manager
    libguestfs                # Virtual HDD Tool
    libinput                  # Input Library
    virtualglLib              # GPU Util
    wl-clipboard              # Wayland Clipboard Utility
    cairo                     # 2D Graphics Library
    ffmpeg                    # Video/Audio Processing
    cups-pk-helper            # Polkit helper
    openrazer-daemon          # Razer Peripheral helper
    jmtpfs                    # MPT USB file transfer for Android phones

  ];

}
