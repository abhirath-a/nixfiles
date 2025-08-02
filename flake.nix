{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    stylix.url = "github:nix-community/stylix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    abhivim.url = "github:abhirath-a/nixvim-config";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      abhivim,
      spicetify-nix,
      stylix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        gtx-nix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            # default nixos configuration file
            ./hosts/gtx-nix/configuration.nix
            # nix vim
            (
              { pkgs, ... }:
              {
                environment = {
                  systemPackages = [
                    abhivim.packages.${pkgs.system}.default
                  ];
                  variables.EDITOR = "nvim";
                };
              }
            )
            # stylix
            stylix.nixosModules.stylix
            # home-manager
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = { inherit inputs; };
                useGlobalPkgs = true;
                useUserPackages = true;
                users.abhi.imports = [
                  ./home
                  spicetify-nix.homeManagerModules.default
                ];
              };
            }
          ];
        };
      };
    };
}
