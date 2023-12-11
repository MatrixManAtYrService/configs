{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix.url = "github:helix-editor/helix?ref=23.10";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, helix, nix-darwin }@inputs: {

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

    darwinConfigurations = {

      # nix run nix-darwin -- switch --flake .#LIGO --show-trace
      LIGO = nix-darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          ./ligo/configuration.nix
          home-manager.darwinModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              users.matt = import ./home-manager/common.nix;
              sharedModules = [
                ./home-manager/astronomer.nix
                ./home-manager/rust.nix
              ];
            };
          }
        ];
        specialArgs = { inherit inputs; inherit self; };
      };
    };
    darwinPackages = self.darwinConfigurations."LIGO".pkgs;

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
          ./home-manager/linux-home.nix
          ./home-manager/common.nix
          ./home-manager/gnome-nice.nix
          ./choedankal/dconf.nix
        ];
      };
    };
  };
}

