# Rohaan's NixOS Config - Desktop packages

{ config, pkgs, ... }:

# Pinned packages source for bambu-studio build issues
let
  pinnedPkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/04607e1165ac22c5fde6dcc54c9e0b3c0487c555.tar.gz";
    sha256 = "0ivfvfm86f81jpyycqlbq96kyk5nd5vp786f69zsjxv17bkam83w";
  }) { config = config.nixpkgs.config; };
in

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

    # Creative Tools
    # bambu-studio            # 3D Printing Slicer (HAS BUILD ISSUES - use pinned version)
    pinnedPkgs.bambu-studio   # Pinned to nixpkgs 04607e1 — update manually
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

}
