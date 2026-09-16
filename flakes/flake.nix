{
  description = "Rohaan's NixOS Configuration";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-2505.url = "github:NixOS/nixpkgs/nixos-25.05";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    nixCats.url = "github:BirdeeHub/nixCats-nvim";
  };

  outputs = { self, nixpkgs, nixpkgs-2505, nixos-wsl, nix-flatpak, nixCats, ... }:
  let
    system = "x86_64-linux";

    commonArgs = {
      pkgs-2505 = nixpkgs-2505.legacyPackages.${system};
      inherit nixCats;
    };
  in
  {
    nixosConfigurations = {

      swift = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = commonArgs;
        modules = [
          ./hosts/swift/default.nix
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = commonArgs;
        modules = [
          ./hosts/desktop/default.nix
          nix-flatpak.nixosModules.nix-flatpak
        ];
      };

      wsl = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = commonArgs;
        modules = [
          ./hosts/wsl/default.nix
          nixos-wsl.nixosModules.wsl
        ];
      };

    };
  };
}
