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
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      catppuccin,
      nvf,
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
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.abhi = {
                imports = [
                  ./home.nix
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
