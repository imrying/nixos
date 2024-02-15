{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    helix.url = "github:helix-editor/helix/master";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      rying-driver = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; }; 
          modules = [ 
              ./nix/configuration.nix 
          ];
      };
    };

  };
}
