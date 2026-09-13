# Rohaan's NixOS Config - nix-ld for unpackaged binaries

{ config, pkgs, ... }:

{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # Graphics
      libGLU
      libGL
      mesa

      # GTK
      gtk3
      gtk2
      glib
      pango
      cairo
      gdk-pixbuf
      atk
      at-spi2-atk
      at-spi2-core
      dracula-theme

      # X11
      libx11
      libxext
      libxrender
      libxft
      libxi
      libxmu
      libxt
      libxinerama
      libxrandr
      libxcursor
      libxfixes
      libxcb
      libxxf86vm
      libsm
      libxkbcommon
      libxtst

      # Fonts
      fontconfig
      freetype

      # Image libraries
      libpng
      libjpeg8
      libjpeg
      libtiff

      # System
      zlib
      pcre2
      pcre
      curl
      dbus
      expat
      nspr
      nss
      openssl
      libdrm
      wayland

      # Audio
      alsa-lib
      libpulseaudio
      cups
    ];
  };
}
