# Rohaan's NixOS Config - Fonts

{ config, pkgs, ... }: 

{

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
    font-awesome
  ];

} 
