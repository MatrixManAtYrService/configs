{
  description = "Matts Minions";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix.url = "github:helix-editor/helix?ref=24.07";
    nushell = {
      url = "github:nushell/nushell?ref=0.104.0";
      flake = false;
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    crane = {
      url = "github:ipetkov/crane";
    };
  };

  outputs = { self, nixpkgs, home-manager, helix, nushell, nix-darwin, rust-overlay, crane }@inputs: {

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
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.matt = import ./home-manager/common.nix;
              sharedModules = [
                ./home-manager/astronomer.nix
                ./home-manager/rust.nix
                ./home-manager/asdf.nix
              ];
            };
          }
        ];
        specialArgs = { inherit inputs; inherit self; };
      };

      LISA = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          {
            nixpkgs.overlays = [
             (self: super: {
                nodejs = super.nodejs_22;
                nodejs-slim = super.nodejs-slim_22;
             })
            rust-overlay.overlays.default
            ];
          }
          ./lisa/configuration.nix
          home-manager.darwinModules.home-manager
          {

            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.matt = import ./home-manager/common.nix;
              sharedModules = [
                ./home-manager/darwin-home.nix
                ./home-manager/nushell.nix
                ./home-manager/wezterm-config.nix
                ./home-manager/zellij-config.nix
                ./home-manager/astronomer.nix
                ./home-manager/python.nix
                ./home-manager/nodejs.nix
                ./home-manager/rust.nix
                ./home-manager/cross-compile.nix
                ./home-manager/nixpkgs.nix
              ];
            };
          }
        ];
        specialArgs = { inherit inputs; inherit self; };
      };
    };
    darwinPackages = self.darwinConfigurations."LISA".pkgs;

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
          ./home-manager/astronomer.nix
          ./home-manager/python.nix
          ./home-manager/rust.nix
          ./home-manager/android-dev.nix
          ./home-manager/gnome-nice.nix
          ./home-manager/desktop-basics.nix
          ./home-manager/wezterm-config.nix
          ./home-manager/zellij-config.nix
          ./choedankal/dconf.nix
        ];
      };
    };
  };
}
