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
    rhythmbox                 # Music Playeer

    # Terminal Emulator
    kitty

    # Hardware
    polychromatic             # RGB Configuration
    baobab                    # GUI System Storage Viewer

    # Office & Productivity
    libreoffice-qt            # Office Suite
    hunspell                  # Spell Check
    hunspellDicts.en_GB-ise   # British English Spellcheck dictionary
    speedcrunch               # Calculator
    zed-editor                # Code Editor
    xournalpp                 # Handwriting App

    # File Management/Downloads
    nautilus                  # Graphical File Manager
    localsend                 # Wireless File Transmission
    syncthing                 # Wireless File Sync
    qbittorrent               # Torrenting Client
    nicotine-plus             # P2P Music Client (Soulseek)
    switcheroo                # File convertor
    networkmanagerapplet      # Advanced Network Manager GUI
    universal-android-debloater # Android ADB Debloater

    # Creative Tools
    # bambu-studio            # 3D Printing Slicer (has build issues)
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
    kate                      # Rich Text Editor
    kdeconnect-kde            # Phone-PC Sync
    ark                       # File Archiver
    gwenview                  # Image Viewer
  ]);

  # Enable for better file system navigation in GUI apps
  services.gvfs.enable = true;

}
