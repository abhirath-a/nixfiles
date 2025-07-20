{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    catppuccin.url = "github:catppuccin/nix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    abhivim.url = "github:abhirath-a/nixvim-config";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      catppuccin,
      abhivim,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            # default nixos configuration file
            ./nixos/configuration.nix
            #home-mananger
            (
              { pkgs, ... }:
              {
                environment.systemPackages = [
                  abhivim.packages.${pkgs.system}.default
                ];
                environment.variables.EDITOR = "nvim";
              }
            )
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.abhi = {
                imports = [
                  ./home
                  catppuccin.homeModules.catppuccin
                  inputs.spicetify-nix.homeManagerModules.default
                ];
              };
            }
          ];
        };
      };
    };
}
