# Rohaan's NixOS Config - Desktop packages

{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    # Browsers
    firefox                   # Primary Browser
    brave                     # Chromium-Based Browser

    # Communication
    vesktop                   # Discord Client
    zapzap                    # Whatsapp Client

    # Media
    pear-desktop              # Youtube Music Client
    vlc                       # Media Player
    mpv                       # Media Player

    # Terminal Emulator
    kitty

    # Hardware
    polychromatic             # RGB Configuration

    # Office & Productivity
    libreoffice-qt            # Office Suite
    speedcrunch               # Calculator
    zed-editor                # Code Editor
    xournalpp                 # Handwriting App

    # File Management/Downloads
    localsend                 # Wireless File Transmission
    syncthing                 # Wireless File Sync
    qbittorrent               # Torrenting Client
    nicotine-plus             # P2P Music Client (Soulseek)
    switcheroo                # File convertor

    # Creative Tools
    #bambu-studio             # 3D Printing Slicer (HAS BUILD ISSUES - use flatpak) 
    kicad                     # Circuit & PCB Design Suite
    freecad                   # General CAD
    ltspice                   # Circuit Simulation
    drawio                    # Flowcharts and Diagrams
    inkscape                  # Vector Graphics Editor
    gimp                      # Image Manipulation
    audacity                  # Audio Recording
    obs-studio                # Screen Recording/Streaming

  # KDE Packages
  ] ++ (with pkgs.kdePackages; [
    elisa                     # Music Player
    kate                      # Rich Text Editor
    dolphin                   # File Manager
    kdeconnect-kde            # Phone-PC Sync
    ark                       # File Archiver
    gwenview                  # Image Viewer
  ]);

}
