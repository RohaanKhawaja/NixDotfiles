# Rohaan's NixOS Config - Global Options

{ lib, ... }:

{
  options.myConfig = {

    username = lib.mkOption {
      type = lib.types.str;
      description = "Primary User Username";
    };

    hostname = lib.mkOption {
      type = lib.types.str;
      description = "System Hostname";
    };

    homeDir = lib.mkOption {
      type = lib.types.str;
      description = "Path to primary user's home directory";
    };

    desktop = lib.mkOption {
      type = lib.types.str;
      description = "Active desktop environment";
    };

  };
}
