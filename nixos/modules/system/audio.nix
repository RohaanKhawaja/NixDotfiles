# Rohaan's NixOS Config - Audio Settings

{ config, pkgs, ... }:

{
  # Enable Pipewire for audio 
  services.pipewire = {
    enable = true; 
    alsa.enable = true; 
    alsa.support32Bit = true; 
    pulse.enable = true;
    jack.enable = true; 
  }; 

} 
