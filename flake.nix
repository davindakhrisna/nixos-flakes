{
  # NixOS & Home Manager Configuration
  description = ''
    Nixos-Config: Modular Hyprland, TUI, and Server configuration for NixOS
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    nvf-config = {
      url = "path:./modules/home/tui/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nvf.follows = "nvf";
    };
    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helium-browser = {
      url = "github:oxcl/nix-flake-helium-browser";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    antigravity = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    nixpkgs-unstable,
    ...
  }: let
    system = "x86_64-linux";
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-40.10.5"
        ];
      };
    };
    pkgs = nixpkgs.legacyPackages.${system};
    args = {
      inherit
        inputs
        nixpkgs
        system
        pkgs-unstable
        pkgs
        ;
    };
    merge = nixpkgs.lib.foldl nixpkgs.lib.recursiveUpdate {};
  in
    merge [
      (import ./modules/home/tui/nixy/flake.nix args)
      {
        formatter.${system} = pkgs.alejandra;
        packages.${system}.nvim = inputs.nvf-config.packages.${system}.nvim;
        apps.${system}.nvim = inputs.nvf-config.apps.${system}.nvim;
        nixosConfigurations = {
          powerhouse = import ./hosts/powerhouse/flake.nix args;
          portable = import ./hosts/portable/flake.nix args;
          vm = import ./hosts/vm/flake.nix args;
          server = import ./hosts/server/flake.nix args;

          # Hostname aliases for nixos-rebuild (matches config.var.hostname)
          "AN515-57" = import ./hosts/powerhouse/flake.nix args;
          "A275" = import ./hosts/portable/flake.nix args;
          "vm-nixos" = import ./hosts/vm/flake.nix args;
          "jack" = import ./hosts/server/flake.nix args;
        };
      }
    ];
}
