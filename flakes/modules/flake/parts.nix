# Rohaan's NixOS Config - flake-parts setup
# Enables the flake.modules.<class>.<name> option that every feature file
# uses to register itself (e.g. flake.modules.nixos.niri).

{ inputs, ... }:

{
  imports = [ inputs.flake-parts.flakeModules.modules ];

  # Architectures this flake builds for
  systems = [ "x86_64-linux" ];
}
