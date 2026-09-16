{ lib, ... }:

{
  options.myConfig = {

    username = lib.mkOption {
      type        = lib.types.str;
      description = "Primary user's username";
    };

    hostname = lib.mkOption {
      type        = lib.types.str;
      description = "System hostname";
    };

    homeDir = lib.mkOption {
      type        = lib.types.str;
      description = "Path to primary user's home directory";
    };

    configDir = lib.mkOption {
      type        = lib.types.str;
      description = "Path to dotfiles directory";
    };

    desktop = lib.mkOption {
      type        = lib.types.str;
      description = "Active desktop environment";
    };

  };
}
