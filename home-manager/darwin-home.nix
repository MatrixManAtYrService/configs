{ inputs, lib, config, pkgs, ... }: {

  home = with pkgs; {
    stateVersion = "23.05";
    username = "matt";
    packages = [ tree ];
  };
}
