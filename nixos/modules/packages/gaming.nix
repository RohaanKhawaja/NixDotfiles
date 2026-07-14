# Rohaan's NixOS Config - Gaming packages

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Emulators
    bsnes-hd                  # SNES
    xemu                      # OG XBOX
    flycast                   # Dreamcast
    pcsx2                     # PS2
    dolphin-emu               # GameCube/Wii
    xenia-canary              # XBOX360
    rpcs3                     # PS3
    ppsspp                    # PSP
    melonds                   # DS
    # vita3k                    # PS Vita
    azahar                    # 3DS
    cemu                      # Wii U
    eden                      # Nintendo Switch
  ];

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  environment.sessionVariables = {
    STEAM_RUNTIME = "1";
  };

}
