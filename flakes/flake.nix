# Rohaan's NixOS Config - Flake Entry Point

{
  description = "Rohaan's NixOS configuration";

  inputs = {

    # Main Package Repo
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # FLake framework for dendritic pattern
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    # Auto import every module under ./modules
    import-tree.url = "github:vic/import-tree";

    # Pinned Package sets
    nixpkgs-2505.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Secure Boot
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # WSL Host
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim via nixCats
    nvim = {
      url = "path:./nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
  inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

}
