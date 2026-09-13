# Rohaan's NixOS Config - Custom Scripts

{ config, pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "gmat" ''
      mkdir -p /tmp/gmat-compat-libs
      ln -sf $(find /nix/store -name "libtiff.so.6" -path "*/lib64/*" 2>/dev/null | head -1) /tmp/gmat-compat-libs/libtiff.so.5
      export LD_LIBRARY_PATH="/tmp/gmat-compat-libs:$LD_LIBRARY_PATH"

      mkdir -p /tmp/gmat-config/gtk-3.0
      mkdir -p /tmp/gmat-config/gtk-4.0

      cat > /tmp/gmat-config/gtk-3.0/settings.ini << EOF
[Settings]
gtk-theme-name=Adwaita
gtk-application-prefer-dark-theme=false
EOF

      cat > /tmp/gmat-config/gtk-4.0/settings.ini << EOF
[Settings]
gtk-theme-name=Adwaita
gtk-application-prefer-dark-theme=false
EOF

      export XDG_CONFIG_HOME=/tmp/gmat-config
      export DCONF_PROFILE=/dev/null
      export GSETTINGS_BACKEND=memory
      export GTK_THEME=Adwaita
      export GTK_APPLICATION_PREFER_DARK_THEME=0

      cd ~/Documents/University/Year3/SunSat/borealis/GMAT
      exec ./bin/GMAT-R2026a
    '')
  ];
}
