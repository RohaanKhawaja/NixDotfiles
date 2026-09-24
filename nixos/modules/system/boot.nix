# Rohaan's Nix Config - Boot Settings

# Note: on first install disable the lanzaboote, generate keys using sbctl, then re-enable lanzaboote and rebuild

{ config, pkgs, lib, ... }:

let
  lanzaboote = import (builtins.fetchTarball {
    url    = "https://github.com/nix-community/lanzaboote/archive/v1.1.0.tar.gz";
    sha256 = "sha256:0rgjccwwzfanbf5chx91grmi8v9cgxgsm963ldkdnkh445as7a46";
  }) { inherit pkgs; };
in

{
  imports = [ lanzaboote.nixosModules.lanzaboote ];

  boot.kernelPackages             = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.lanzaboote = {
    enable    = true;
    pkiBundle = "/var/lib/sbctl";
  };

  # Secure Boot Key management
  environment.systemPackages = [ pkgs.sbctl ];

  # Fix for dual boot clock issue
  time.hardwareClockInLocalTime = true;
}
