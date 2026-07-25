# Rohaan's NixOS Config - Terminal packages

{ config, pkgs, ... }:

# Import nixCats.nix for declarative plugin management
let
  myNeovim = import "/etc/nixos/modules/packages/nixcats.nix" {
    inherit pkgs;
    #luaPath = /home/rohaan/.config/nvim;
    luaPath = /. + "${config.myConfig.homeDir}/.config/nvim";
  };

  # For old version of TDF
  pkgs2505 = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/refs/heads/nixos-25.05.tar.gz";
  }) { system = pkgs.system; };

in

{

  environment.systemPackages = with pkgs; [
    # Dev
    myNeovim                  # Text Editor
    tmux                      # Terminal Multiplexer
    stow                      # Dotfiles Management
    git                       # Git
    gh                        # GitHub

    # CLI Tools
    zoxide                    # Better CD
    fzf                       # Fuzzy Find
    tree                      # Tree Listing
    ripgrep                   # Better Grep
    fd                        # Better Find
    bat                       # Better cat
    nix-search-tv             # FZF For Nix Packages/Options
    zip                       # Zip file utility
    unzip                     # Zip file utility
    yt-dlp                    # Youtube Video/audio downloader

    # CLI Apps
    btop                      # System Resource Monitor
    nvtopPackages.intel       # Intel GPU resource monitor
    discordo                  # Client for Discord
    #tdf                      # PDF Viewer (current version broken in tmux)
    img-cat                   # Image Viewer
    yazi                      # File Manager
    cmus                      # Music Player
    taskwarrior3              # Task Manager
    visidata                  # Spreadsheet editor
    khal                      # Calander
    ytui-music                # Youtube Music TUI
    youtube-tui               # Youtube TUI Client

    # Hardware/System Inspection
    lshw                      # Show Bus ID values
    xev                       # Event Logger
    usbutils                  # Shows USB Devices
    archimede                 # Directory Information

    # Terminal Aesthetics
    fastfetch                 # System Specs
    starship                  # Custom Prompt

    # Fun
    fortune                   # Fortune Cookies
    cowsay                    # Cow ASCII Art
    tt                        # Terminal Typing Test
    asciiquarium              # ASCII Aquarium
    cbonsai                   # ASCII Bonsai
    cava                      # Waveform
    cmatrix                   # Matrix Effect
    lolcat                    # Colours
    nyancat                   # Nyancat
    #sl                        # Locomotive (actually pmo)
    tty-solitaire             # Solitaire
    solitaire-tui             # Solitaire
    nsnake                    # Snake
    pipes                     # Pipes Screensaver
    bastet                    # Tetris
  ] ++ [
    pkgs2505.tdf              # Using older version of tdf for tmux compatibility (change if fixed)
  ];

  # Configure Path for ripgrep config
  environment.sessionVariables = {
    RIPGREP_CONFIG_PATH = "${config.myConfig.homeDir}/.ripgreprc";
  };

}
