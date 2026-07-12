# Rohaan's Nix Config - User file
{ config, pkgs, ... }:

{
  # Define primary user account.
  users.users.${config.myConfig.username} = {
    isNormalUser = true;
    description = "Rohaan Khawaja";
    shell = pkgs.bash;
    extraGroups = [ 
      "networkmanager" # Network Management
      "wheel" 	       # Sudo Access
      "input" 	       # Raw input device access
      "plugdev"        # Peripheral device access
    ];
  };

}
