# /etc/nixos/flake.nix

{
  description = "ASUS's reproducible NixOS setup";

  # 1. Inputs: Define external sources and lock them down
  inputs = {
    # Nixpkgs is the source of all packages and NixOS modules
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05"; # Pin to a stable branch

    # Home Manager for user-specific configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      # Ensure Home Manager uses the exact same Nixpkgs version as the system
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # 2. Outputs: Define what this flake provides
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # Define your NixOS configuration (you can define multiple machines here)
    nixosConfigurations.my-laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the core system configuration
        ./configuration.nix

        # Import the Home Manager module for system integration
        home-manager.nixosModules.home-manager
      ];
    };
  };
}
