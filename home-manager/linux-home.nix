{ inputs, lib, config, pkgs, ... }: {

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
    overlays = [
      (final: previous: {
        helix = inputs.helix.packages.${final.system}.helix;
      })
    ];
  };


  home = {
    stateVersion = "23.05";
    username = "matt";
    homeDirectory = "/home/matt";
  };

  programs.home-manager.enable = true;
}
