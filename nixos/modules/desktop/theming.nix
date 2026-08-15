# Rohaan's NixOS Config - Dracula Theming

{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [

    # QT Framework
    libsForQt5.qt5ct          # QT5 Framework
    libsForQt5.qt5.qtwayland  # QT5 Wayland
    kdePackages.qt6ct         # QT6 Configuration
    kdePackages.qtwayland     # QT6 Wayland
    libsForQt5.qtstyleplugins

    # GTK Framework
    adw-gtk3

    # Colour Themeing
    matugen
    dracula-theme
  ];

  # GTK Theming
  programs.dconf = {
    enable = true;
    profiles.user.databases = [{
      settings."org/gnome/desktop/interface" = {
        gtk-theme = "Dracula";
        color-scheme = "prefer-dark";
      };
    }];
  };

  # QT Theming
  qt = {
    enable = true;
    platformTheme = "gtk2";
    style = "gtk2";
  };

  # GTK cursor settings for XWayland apps
  environment.etc."gtk-3.0/settings.ini".text = ''
      [Settings]
      gtk-cursor-theme-name=BreezeX-RosePine-Linux
      gtk-cursor-theme-size=24
  '';

  # Cursor theme and QT Colour Scheming
  environment.sessionVariables = {
    XCURSOR_THEME = "BreezeX-RosePine-Linux";
    XCURSOR_SIZE = "24";
  };

}
