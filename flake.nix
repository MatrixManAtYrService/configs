{ description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master"; home-manager.inputs.nixpkgs.follows = "nixpkgs";
    helix.url = "github:helix-editor/helix?ref=23.10";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    # NixOS configuration entrypoint Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = { 
      vorpal = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ ./vorpal/configuration.nix ];
      };
      choedankal = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ ./choedankal/configuration.nix ];
      };
      wsl = nixpkgs.lib.nixosSystem { 
        specialArgs = { inherit inputs; };
        modules = [ ./wsl/configuration.nix ];
      };
    };

    # Standalone home-manager configuration entrypoint Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {

      "matt@vorpal" = home-manager.lib.homeManagerConfiguration { 
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home-manager/home.nix
          ./home-manager/gui.nix
          ./vorpal/dconf.nix
          ./vorpal/dconf-mod.nix
        ];
      };
      "matt@choedankal" = home-manager.lib.homeManagerConfiguration { 
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home-manager/common.nix
          ./home-manager/gnome-nice.nix
          #./home-manager/gui.nix
          ./choedankal/dconf.nix
          #./choedankal/dconf-mod.nix
        ];
      };
      "nixos@nixos" = home-manager.lib.homeManagerConfiguration { 
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; }; 
        modules = [
          ./home/manager/home.nix
        ];
      };
    };
  };
}

