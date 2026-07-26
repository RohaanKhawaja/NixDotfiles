# Rohaan's NixOS Config - XDG MIME Default Applications

{ config, pkgs, ... }:

{
  # Enable XDG Mime to set default apps
  xdg.mime.enable = true;

  environment.etc."xdg/mimeapps.list".text = ''
    [Default Applications]

    # Web
    text/html=firefox.desktop
    application/xhtml+xml=firefox.desktop
    x-scheme-handler/http=firefox.desktop
    x-scheme-handler/https=firefox.desktop
    x-scheme-handler/ftp=firefox.desktop

    # Documents
    application/pdf=firefox.desktop
    application/epub+zip=firefox.desktop
    application/oxps=firefox.desktop
    application/vnd.ms-xpsdocument=firefox.desktop

    # Text / Code
    text/plain=nvim.desktop
    text/markdown=nvim.desktop
    text/x-markdown=nvim.desktop
    text/org=nvim.desktop
    text/x-org=nvim.desktop
    text/css=nvim.desktop
    text/javascript=nvim.desktop
    text/x-python=nvim.desktop
    text/x-lua=nvim.desktop
    text/x-shellscript=nvim.desktop
    text/x-sh=nvim.desktop
    text/x-c=nvim.desktop
    text/x-csrc=nvim.desktop
    text/x-chdr=nvim.desktop
    text/x-c++src=nvim.desktop
    text/x-c++hdr=nvim.desktop
    text/xml=nvim.desktop
    application/json=nvim.desktop
    application/toml=nvim.desktop
    application/x-yaml=nvim.desktop
    text/x-nix=nvim.desktop

    # Images
    image/png=imv.desktop
    image/jpeg=imv.desktop
    image/jpg=imv.desktop
    image/gif=imv.desktop
    image/webp=imv.desktop
    image/svg+xml=imv.desktop
    image/tiff=imv.desktop
    image/bmp=imv.desktop
    image/x-bmp=imv.desktop
    image/avif=imv.desktop
    image/heic=imv.desktop

    # Video
    video/mp4=vlc.desktop
    video/mkv=vlc.desktop
    video/x-matroska=vlc.desktop
    video/webm=vlc.desktop
    video/avi=vlc.desktop
    video/x-msvideo=vlc.desktop
    video/mov=vlc.desktop
    video/quicktime=vlc.desktop
    video/x-flv=vlc.desktop
    video/ogg=vlc.desktop
    video/mpeg=vlc.desktop

    # Audio
    audio/mp3=rhythmbox.desktop
    audio/mpeg=rhythmbox.desktop
    audio/flac=rhythmbox.desktop
    audio/x-flac=rhythmbox.desktop
    audio/ogg=rhythmbox.desktop
    audio/wav=rhythmbox.desktop
    audio/x-wav=rhythmbox.desktop
    audio/aac=rhythmbox.desktop
    audio/opus=rhythmbox.desktop
    audio/m4a=rhythmbox.desktop

    # Archives
    application/zip=nautilus.desktop
    application/x-tar=nautilus.desktop
    application/x-bzip2=nautilus.desktop
    application/x-gzip=nautilus.desktop
    application/x-xz=nautilus.desktop
    application/x-zstd=nautilus.desktop
    application/x-7z-compressed=nautilus.desktop
    application/x-rar=nautilus.desktop
    application/x-rar-compressed=nautilus.desktop

    # Office
    application/vnd.oasis.opendocument.text=libreoffice-writer.desktop
    application/vnd.oasis.opendocument.spreadsheet=libreoffice-calc.desktop
    application/vnd.oasis.opendocument.presentation=libreoffice-impress.desktop
    application/msword=libreoffice-writer.desktop
    application/vnd.openxmlformats-officedocument.wordprocessingml.document=libreoffice-writer.desktop
    application/vnd.ms-excel=libreoffice-calc.desktop
    application/vnd.openxmlformats-officedocument.spreadsheetml.sheet=libreoffice-calc.desktop
    application/vnd.ms-powerpoint=libreoffice-impress.desktop
    application/vnd.openxmlformats-officedocument.presentationml.presentation=libreoffice-impress.desktop

    # Torrents
    application/x-bittorrent=transmission-gtk.desktop
    x-scheme-handler/magnet=transmission-gtk.desktop

    # Email / Calendar
    x-scheme-handler/mailto=firefox.desktop
    text/calendar=firefox.desktop
    application/ics=firefox.desktop
  '';

}
