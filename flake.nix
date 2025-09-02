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
    abhivim.url = "github:abhirath-a/nvim";
    textfox.url = "github:adriankarlen/textfox";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      abhivim,
      spicetify-nix,
      stylix,
      textfox,
      nur,
      ...
    }@inputs:
    {
      nixosConfigurations.gtx-nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/gtx-nix/configuration.nix
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          # Adds the NUR overlay
          nur.modules.nixos.default
          # NUR modules to import
          nur.legacyPackages."x86_64-linux".repos.iopq.modules.xraya
          {
            home-manager = {
              extraSpecialArgs = { inherit inputs; };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.abhi.imports = [
                ./home
                spicetify-nix.homeManagerModules.default
                textfox.homeManagerModules.default
              ];
            };
          }
        ];
      };
    };
}
